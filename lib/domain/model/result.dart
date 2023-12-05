import 'package:first_flutter/domain/model/fail_data.dart';

class Result<T> {}


class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Fail<T> extends Result<T> {
  final FailData e;

  Fail(this.e);
}
