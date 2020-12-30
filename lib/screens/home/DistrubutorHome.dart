import 'package:canaarange/screens/auth/welcome_screen.dart';
import 'package:canaarange/services/firebase/auth.dart';
import 'package:canaarange/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DistriHome extends StatefulWidget {
  @override
  _DistriHomeState createState() => _DistriHomeState();
}

class _DistriHomeState extends State<DistriHome> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: kPrimaryColor.withOpacity(0.2),
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: kPrimaryColor,
                  child: Image.asset('assets/images/clock.png')),
            ),
            Column(
              children: [
                Text(
                  'Wainting Approval !',
                  style: BigBoldHeading,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Account is being submitted for Approval. Please check your mail for Activation Link. ',
                  textAlign: TextAlign.center,
                  style: GreySubtitle.copyWith(fontSize: 20),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 85,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text('GO BACK', style: WhiteSerifHeading),
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // RaisedButton(
            //   color: Colors.red,
            //   elevation: 0,
            //   textColor: Colors.white,
            //   onPressed: () async {
            //     await _auth.signOut();
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(),
            //       Text(
            //         'LOGOUT',
            //         style: WhiteSubtitle,
            //       ),
            //       Icon(Icons.close)
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
