import 'rest.dart';
import '../models/food.dart';

class FoodService {
  Future<List<Food>> getFoodList() async {
    final List jsonList = await Rest.get('foods');
    if (jsonList == null) return null;
    return jsonList.map((json) => Food.fromJson(json)).toList();

    // return jsonList.map((json) => Todo.fromJson(json)).toList();
  }
}
