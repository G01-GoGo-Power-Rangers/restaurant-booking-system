import 'rest.dart';
import '../models/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String login, String password}) async {
    final List listJson =
        await Rest.get('users?login=$login&password=$password');

    if (listJson.length == 0) return null;

    return User.fromJson(listJson[0]);
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:restaurant_booking_system/models/user.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   //create user obj on UserCredentials
//   Anon _customerFromUserCredential(User anon) {
//     return anon != null ? Anon(uid: anon.uid) : null;
//   }

//   //Stream of user
//   Stream<Anon> get user {
    // return _auth.authStateChanges().map((_customerFromUserCredential));
//   }

//   // login anonymously
//   Future loginAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User user = result.user;
//       return _customerFromUserCredential(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // log in with email and pass

//   // register with email and pass

//   // sign out

// }
