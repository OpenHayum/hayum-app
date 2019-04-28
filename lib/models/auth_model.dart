class Auth {
  User _user;
  Session _session;

  Auth.fromJson(Map<String, dynamic> parsedJson) {
    _user = User(parsedJson['User']);
    _session = Session(parsedJson['Session']);
  }

  User get user => _user;

  Session get session => _session;
}

class User {
  String _firstname;
  String _lastname;
  String _email;
  String _mobile;

  User(result) {
    print(result);
    _firstname = result['FirstName'];
    _lastname = result['LastName'];
    _email = result['Email'];
    _mobile = result['Mobile'];
  }

  String get firstname => _firstname;

  String get mobile => _mobile;

  String get email => _email;

  String get lastname => _lastname;
}

class Session {
  int _userId;
  String _sessionId;

  Session(result) {
    print(result);
    _userId = result['UserID'];
    _sessionId = result['SessionID'];
  }

  int get userId => _userId;

  String get sessionId => _sessionId;
}
