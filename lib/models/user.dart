class User {
  String _id;
  String _username;
  String _email;
  String _password;
  String _fullname;
  String _usertype;
  String _photo;

  User({id, username, email, password, fullname, usertype, photo})
      : this._id = id,
        this._username = username,
        this._email = email,
        this._password = password,
        this._fullname = fullname,
        this._usertype = usertype,
        this._photo = photo;

  get id => _id;
  set id(value) => _id = value;
  get username => _username;
  set username(value) => _username = value;
  get email => _email;
  set email(value) => _email = value;
  get password => _password;
  set password(value) => _password = value;
  get fullname => _fullname;
  set fullname(value) => _fullname = value;
  get usertype => _usertype;
  set usertype(value) => _usertype = value;
  get photo => _photo;
  set photo(value) => _photo = value;

  User.copy(User from)
      : this(
          id: from.id,
          username: from.username,
          email: from.email,
          password: from.password,
          fullname: from.fullname,
          usertype: from.usertype,
          photo: from.photo,
        );

  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            username: json['username'],
            email: json['email'],
            password: json['password'],
            usertype: json['usertype'],
            fullname: json['fullname'],
            photo: json['photo']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'password': password,
        'fullname': fullname,
        'usertype': usertype,
        'photo': photo
      };
}
