<<<<<<< HEAD
class User {
  String _id;
  String _username;
  String _email;
  String _password;
  String _fullname;
  String _usertype;

  User({id, username, email, password, fullname, usertype})
      : this._id = id,
        this._username = username,
        this._email = email,
        this._password = password,
        this._fullname = fullname,
        this._usertype = usertype;

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

  User.copy(User from)
      : this(
          id: from.id,
          username: from.username,
          email: from.email,
          password: from.password,
          fullname: from.fullname,
          usertype: from.usertype,
        );

  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            username: json['username'],
            email: json['email'],
            password: json['password'],
            usertype: json['usertype'],
            fullname: json['fullname']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'password': password,
        'fullname': fullname,
        'usertype': usertype
      };
=======
class Customer {
  final String uid;

  Customer({this.uid});
>>>>>>> 6650c59c6035b594b6e0bcce9c7847415aa73ca3
}
