class User {
  String _avatarUrl;
  String _name;
  String _login;
  String _location;

  User(
    this._avatarUrl,
    this._name,
    this._login,
    this._location,
  );

  User.map(dynamic obj) {
    this._avatarUrl = obj['avatarUrl'];
    this._name = obj['name'];
    this._login = obj['login'];
    this._location = obj['location'];
  }

  String get avatarUrl => _avatarUrl;
  String get name => _name;
  String get login => _login;
  String get location => _location;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["avatarUrl"] = _avatarUrl;
    map["name"] = _name;
    map["login"] = _login;
    map["location"] = _location;
    return map;
  }
}
