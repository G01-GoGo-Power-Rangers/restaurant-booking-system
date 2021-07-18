import 'package:restaurant_booking_system/models/booking.dart';

import '../dependencies.dart';
import 'rest.dart';

class BookingService {
  final restService = service<Rest>();

  Future<List<Booking>> getBookingList() async {
    final List jsonList = await restService.get('bookings');
    if (jsonList == null) return null;
    return jsonList.map((json) => Booking.fromJson(json)).toList();
  }

  Future<List<Booking>> getNewBookingList() async {
    final List jsonList = await restService.get('bookings/newbookinglist');
    if (jsonList == null) return null;
    return jsonList.map((json) => Booking.fromJson(json)).toList();
  }

  Future<List<Booking>> getHistoryBookingList() async {
    final List jsonList = await restService.get('bookings/historybookinglist');
    if (jsonList == null) return null;
    return jsonList.map((json) => Booking.fromJson(json)).toList();
  }

  Future<Booking> createNewBooking(Booking booking) async {
    final json = await restService.post('bookings/newbooking', data: booking);
    if (json == null) return null;
    return Booking.fromJson(json);
  }

  Future<List<Booking>> getUserBookingList(String userid) async {
    final List jsonList = await restService.get('bookings/userbooking/$userid');
    if (jsonList == null) return null;
    return jsonList.map((json) => Booking.fromJson(json)).toList();
  }

  Future<Booking> getBooking(String bookingid) async {
    final json = await restService.get('bookings/$bookingid');
    if (json == null) return null;
    return Booking.fromJson(json);
  }

  Future<Booking> updateBookingStatus(String bookingid) async {
    final json = await restService.get('bookings/bookingstatus/$bookingid');
    if (json == null) return null;
    return Booking.fromJson(json);
  }
}
