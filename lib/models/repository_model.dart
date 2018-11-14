class Repository {
  String _name;
  String _description;
  int _nPullRequests;

  Repository(
      this._name,
      this._description,
      this._nPullRequests
      );

  Repository.map(dynamic obj) {
    this._name = obj['name'];
    this._description = obj['description'];
    this._nPullRequests = obj['pullRequests']['totalCount'];
  }

  String get name => _name;
  String get description => _description;
  int get pullRequests => _nPullRequests;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["nPullRequests"] = _nPullRequests;
    return map;
  }
}
