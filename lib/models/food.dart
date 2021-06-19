class Food {
  String _id;
  String _foodname;
  dynamic _foodprice;
  String _fooddesc;
  String _foodcategory;
  String _foodphoto;

  Food({id, foodname, foodprice, fooddesc, foodcategory, foodphoto})
      : _id = id,
        _foodname = foodname,
        _foodprice = foodprice,
        _fooddesc = fooddesc,
        _foodcategory = foodcategory,
        _foodphoto = foodphoto;

  get id => _id;
  set id(value) => _id = value;
  get foodname => _foodname;
  set foodname(value) => _foodname = value;
  get foodprice => _foodprice;
  set foodprice(value) {
    return _foodprice = value;
  }

  get fooddesc => _fooddesc;
  set fooddesc(value) => _fooddesc = value;
  get foodcategory => _foodcategory;
  set foodcategory(value) => _foodcategory = value;
  get foodphoto => _foodphoto;
  set foodphoto(value) => _foodphoto = value;

  Food.copy(Food from)
      : this(
          id: from.id,
          foodname: from.foodname,
          foodprice: from.foodprice,
          fooddesc: from.fooddesc,
          foodcategory: from.fooddesc,
          foodphoto: from.foodphoto,
        );

  Food.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          foodname: json['foodname'],
          foodprice: json['foodprice'],
          fooddesc: json['fooddesc'],
          foodcategory: json['foodcategory'],
          foodphoto: json['foodphoto'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'foodname': foodname,
        'foodprice': foodprice,
        'fooddesc': fooddesc,
        'foodcategory': foodcategory,
        'foodphoto': foodphoto,
      };
}
