import 'package:dio/dio.dart';
import 'package:first_flutter/data/model/BaseResp.dart';
import 'package:first_flutter/domain/model/fail_data.dart';

class Single<T> {}


class SingleSuccess<T> extends Single<T> {
  final T data;

  SingleSuccess(this.data);
}

class SingleError<T> extends Single<T> {
  final BaseResp e;

  SingleError(this.e);
}

extension SingleSourceExtensions<T> on Single<T> {
  Single<T> onSuccess(Function(T) fn) {
    if (this is SingleSuccess<T>) {
      fn((this as SingleSuccess<T>).data);
    }
    return this;
  }

  Single<T> subscribe(Response resp, T Function(Map<String, dynamic>) fromJson) {
    if (200 <= resp.statusCode! && resp.statusCode! < 300) {
      BaseResp result = BaseResp.fromJson(resp.data);
      if (result.response == "True") {
        return SingleSuccess(fromJson(resp.data));
      } else {
        return SingleError(result);
      }
    } else {
      try {
        BaseResp result = BaseResp.fromJson(resp.data);
        return SingleError(result);
      } catch (e) {
        return SingleError(BaseResp(response: "${resp.statusCode}", error: "${resp.statusMessage}"));
      }
    }
  }

  void onError(Function(BaseResp) fn) {
    if (this is SingleError) {
      fn((this as SingleError).e);
    }
  }
  Single<T> map(T Function(Map<String, dynamic>) toDomain) {
    if (this is SingleSuccess) {
      return SingleSuccess(toDomain((this as SingleSuccess).data));
    } else {
      return this;
    }
  }
}
