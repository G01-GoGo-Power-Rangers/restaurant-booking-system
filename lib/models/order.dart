class Order {
  String _id = '';
  String _bookingid = '';
  double _totalPrice;
  List<Map> _foods;

  get id => _id;
  set id(value) => _id = value;

  get bookingid => _bookingid;
  set bookingid(value) => _bookingid = value;

  get totalPrice => _totalPrice;
  set totalPrice(value) => _totalPrice = value;

  List<Map> get foods => _foods;
  set foods(List<Map> value) => _foods = [...value];

  Order({id, bookingid, totalPrice, foods})
      : _id = id,
        _bookingid = bookingid,
        _totalPrice = totalPrice,
        _foods = [...foods];

  Order.copy(Order from)
      : this(
            id: from.id,
            bookingid: from.bookingid,
            totalPrice: from.totalPrice,
            foods: from.foods);

  Order.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            bookingid: json['bookingid'],
            totalPrice: json['totalPrice'],
            foods: json['foods']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookingid': bookingid,
        'totalPrice': totalPrice,
        'foods': [...foods]
      };
}
