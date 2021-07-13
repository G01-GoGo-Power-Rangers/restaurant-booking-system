import 'package:get_it/get_it.dart';
import 'package:restaurant_booking_system/services/rest.dart';
import 'package:restaurant_booking_system/services/rest_service.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

import 'services/booking_service.dart';
import 'services/food_service.dart';
import 'services/order_service.dart';
import 'services/user_service.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton<Rest>(() => RestService()); //for other services
  service.registerLazySingleton(() => UserService()); //for providers
  service.registerLazySingleton(() => FoodService()); //for providers
  service.registerLazySingleton(() => BookingService()); //for providers
  service.registerLazySingleton(() => OrderService()); //for providers
  service.registerLazySingleton(() => BookingListViewModel()); //for viewmodel
}
