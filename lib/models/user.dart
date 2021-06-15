class User {
  String _userid;
  String _username;
  String _email;
  String _password;
  String _fullname;

  User({userid, username, email, password, fullname})
      : this._userid = userid,
        this._username = username,
        this._email = email,
        this._password = password,
        this._fullname = fullname;

  get userid => _userid;
  set userid(value) => _userid = value;
  get username => _username;
  set username(value) => _username = value;
  get email => _email;
  set email(value) => _email = value;
  get password => _password;
  set password(value) => _password = value;
  get fullname => _fullname;
  set fullname(value) => _fullname = value;

  User.copy(User from)
      : this(
          userid: from.userid,
          username: from.username,
          email: from.email,
          password: from.password,
          fullname: from.fullname,
        );

  User.fromJson(Map<String, dynamic> json)
      : this(
            userid: json['id'],
            username: json['username'],
            email: json['email'],
            password: json['password'],
            fullname: json['fullname']);
}
