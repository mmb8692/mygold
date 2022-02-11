class ApiResponseModel {
  String _data;
  bool _isSuccess;
  int _statusCode;
  List<dynamic> _message;

  ApiResponseModel(
      this._data, this._isSuccess, this._statusCode, this._message);

  String get data => _data;
  set data(String value) {
    _data = value;
  }

  bool get isSuccess => _isSuccess;
  set isSuccess(bool value) {
    _isSuccess = value;
  }

  int get statusCode => _statusCode;

  set statusCode(int value) {
    _statusCode = value;
  }

  List<dynamic> get message => _message;

  set message(List<dynamic> value) {
    _message = value;
  }
}
