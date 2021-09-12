class eChat {

  late String _name;
  late String _message;
  late String _picturePath;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get message => _message;

  String get picturePath => _picturePath;

  set picturePath(String value) {
    _picturePath = value;
  }

  set message(String value) {
    _message = value;
  }
}