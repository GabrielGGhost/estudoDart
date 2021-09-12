class eChat {

  late String _name;
  late String _message;
  late String _picturePath;

  eChat(this._name, this._message, this._picturePath);

  String get name => _name;
  String get message => _message;
  String get picturePath => _picturePath;

  set name(String value) {
    _name = value;
  }
  set picturePath(String value) {
    _picturePath = value;
  }
  set message(String value) {
    _message = value;
  }
}