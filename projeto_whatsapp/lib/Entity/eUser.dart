class eUser {

  late String _name;
  late String _email;
  late String _password;

  String get name => _name;
  String get email => _email;
  String get password => _password;

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }
}