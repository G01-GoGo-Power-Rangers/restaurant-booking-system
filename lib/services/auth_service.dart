// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:restaurant_booking_system/models/user.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   //create user obj on UserCredentials
//   Customer _customerFromUserCredential(User customer) {
//     return customer != null ? Customer(uid: customer.uid) : null;
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
