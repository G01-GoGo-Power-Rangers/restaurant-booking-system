class Booking {
  String _id;
  String _date;
  String _time;
  String _status;
  int _person;
  dynamic _price;
  String _table;
  String _userid;
  String _customername;

  get id => _id;
  set id(value) => _id = value;
  get date => _date;
  set date(value) => _date = value;
  get time => _time;
  set time(value) => _time = value;
  get status => _status;
  set status(value) => _status = value;
  get person => _person;
  set person(value) => _person = value;
  get price => _price;
  set price(value) => _price = value;
  get table => _table;
  set table(value) => _table = value;
  get userid => _userid;
  set userid(value) => _userid = value;
  get customername => _customername;
  set customername(value) => _customername = value;

  Booking({id, date, time, status, person, price, table, userid, customername})
      : _id = id,
        _date = date,
        _time = time,
        _status = status,
        _person = person,
        _price = price,
        _table = table,
        _userid = userid,
        _customername = customername;

  Booking.copy(Booking from)
      : this(
            id: from.id,
            date: from.date,
            time: from.time,
            status: from.status,
            person: from.person,
            price: from.price,
            table: from.table,
            userid: from.userid,
            customername: from.customername);

  Booking.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            date: json['date'],
            time: json['time'],
            status: json['status'],
            person: json['person'],
            price: json['price'],
            table: json['table'],
            userid: json['userid'],
            customername: json['customername']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'time': time,
        'status': status,
        'person': person,
        'price': price,
        'table': table,
        'userid': userid,
        'customername': customername
      };
}
