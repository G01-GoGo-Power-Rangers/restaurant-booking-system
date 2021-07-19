import '../dependencies.dart';
import 'rest.dart';
import '../models/user.dart';

class UserService {
  final restService = service<Rest>();

  Future<User> getUserByLoginAndPassword(
      {String username, String password}) async {
    final json = await restService.get('users/user/$username/$password');

    if (json == null) return null;

    return User.fromJson(json);
  }

  Future<User> createNewUser(User user) async {
    final json = await restService.post('users/adduser', data: user);

    if (json == null) return null;

    return User.fromJson(json);
  }
}
