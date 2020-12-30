import 'package:canaarange/services/firebase/auth.dart';
import 'package:canaarange/styles/styles.dart';
import 'package:flutter/material.dart';

class DonorHome extends StatefulWidget {
  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
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
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Congratulations !',
                  style: BigBoldHeading,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You\'ve become a donor ',
                  textAlign: TextAlign.center,
                  style: GreySubtitle.copyWith(fontSize: 20),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
                        Text('Proceed to donor Account',
                            style: WhiteSerifHeading),
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
            RaisedButton(
              color: Colors.red,
              elevation: 0,
              textColor: Colors.white,
              onPressed: () async {
                await _auth.signOut();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    'LOGOUT',
                    style: WhiteSubtitle,
                  ),
                  Icon(Icons.close)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
