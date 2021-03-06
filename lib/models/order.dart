class Order {
  String _id = '';
  String _bookingid = '';
  dynamic _totalPrice;
  List<dynamic> _foods;

  get id => _id;
  set id(value) => _id = value;

  get bookingid => _bookingid;
  set bookingid(value) => _bookingid = value;

  get totalPrice => _totalPrice;
  set totalPrice(value) => _totalPrice = value;

  List<dynamic> get foods => _foods;
  set foods(List<dynamic> value) => _foods = value;

  Order({id, bookingid, totalPrice, foods})
      : _id = id,
        _bookingid = bookingid,
        _totalPrice = totalPrice,
        _foods = foods;

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
            totalPrice: json['totalprice'],
            foods: json['foods']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookingid': bookingid,
        'totalprice': totalPrice,
        'foods': foods
      };
}
