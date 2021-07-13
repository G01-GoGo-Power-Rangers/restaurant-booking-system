import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

class ProfileScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Container(
      padding: EdgeInsets.only(top: 0.0),
      child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: -2,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/images/profile-icon.png',
                  ),
                )),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _CustomTextField(
                  labelValue: 'Full name',
                  textValue: '${loginViewModel.user.fullname}',
                  icon: Icon(Icons.person),
                ),
                //
                _CustomTextField(
                  labelValue: 'Username',
                  textValue: '${loginViewModel.user.username}',
                  icon: Icon(Icons.person_off_outlined),
                ),

                _CustomTextField(
                  labelValue: 'Email',
                  textValue: '${loginViewModel.user.email}',
                  icon: Icon(Icons.mail_outline_outlined),
                ),

                _CustomTextField(
                  labelValue: 'User Type',
                  textValue: '${loginViewModel.user.usertype}',
                  icon: Icon(Icons.event_busy),
                ),
              ],
            ),
          ]),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final myController = TextEditingController();
  final String _textValue;
  final String _labelValue;
  final Widget _icon;
  _CustomTextField({String textValue, String labelValue, Widget icon})
      : _textValue = textValue,
        _labelValue = labelValue,
        _icon = icon;
  void dispose() {
    myController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
      // child: Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.deepOrange[300]),
          enabled: false,
          filled: false,
          prefixIcon: _icon,
          labelText: '$_labelValue',
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(20.0))),
        ),
        readOnly: true,
        controller: myController..text = '$_textValue',
      ),
    );
  }
}

// class ProfileScreenBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     HomeScreenViewModel homeScreenViewModel =
//         Provider.of<HomeScreenViewModel>(context);
//     LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Container(
//           height: size.height * 0.2,
//           child: Stack(
//             children: <Widget>[
//               Ink(
//                 height: size.height * 0.2 - 27,
//                 decoration: BoxDecoration(
//                   color: kPrimaryColorDark,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(36),
//                     bottomRight: Radius.circular(36),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 25, top: 20, right: 25),
//                   child: Row(
//                     children: [
//                       Text(
//                         '${loginViewModel.username}',
//                         style: TextStyle(
//                             fontSize: 35,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Spacer(),
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                           'https://firebasestorage.googleapis.com/v0/b/fir-first-project-98a7e.appspot.com/o/profilepictest.jpg?alt=media&token=bdb0608d-86d9-460c-b6ea-33fa3fc5057d',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 350.0),
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               primary: Colors.red,
//               backgroundColor: Colors.white,
//               side: BorderSide(color: Colors.red, width: 2.0),
//               padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
//               minimumSize: Size(230.0, 50.0),
//             ),
//             child: Text(
//               'Log out',
//               style: TextStyle(
//                   color: Colors.red, fontSize: 25, fontWeight: FontWeight.w400),
//             ),
//             onPressed: () {
//               homeScreenViewModel.selectedIndex = 0;
//               loginViewModel.onTapLogOut(context);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
