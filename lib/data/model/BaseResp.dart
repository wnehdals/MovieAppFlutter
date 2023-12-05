class BaseResp {
  final String? response;
  final String? error;
  BaseResp({this.response, this.error});
  factory BaseResp.fromJson(Map<String, dynamic> json) {
    return BaseResp(
      response: json['Response'],
      error: json['Error']
    );
  }
}