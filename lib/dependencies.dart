import 'package:get_it/get_it.dart';
import 'package:restaurant_booking_system/services/rest.dart';
import 'package:restaurant_booking_system/services/rest_service.dart';

import 'services/food_service.dart';
import 'services/user_service.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton<Rest>(() => RestService());
  service.registerLazySingleton(() => UserService());
  service.registerLazySingleton(() => FoodService());
}
