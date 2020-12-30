import 'package:canaarange/screens/auth/register_distributor.dart';
import 'package:canaarange/screens/auth/register_donor.dart';
import 'package:canaarange/screens/auth/register_partner.dart';
import 'package:canaarange/services/firebase/auth.dart';
import 'package:canaarange/styles/styles.dart';
import 'package:flutter/material.dart';
// import 'package:goaltracker/screens/auth/welcome.dart';
// import 'package:goaltracker/screens/goals/explore_goals.dart';
// import 'package:goaltracker/screens/goals/main_goals.dart';
// import 'package:goaltracker/screens/goals/new_goal.dart';
// import 'package:goaltracker/services/fire/auth.dart';
// import 'package:goaltracker/style/style.dart';

class WelcomeReg extends StatefulWidget {
  @override
  _WelcomeRegState createState() => _WelcomeRegState();
}

class _WelcomeRegState extends State<WelcomeReg> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 0)).then((_) {
    //   showModalBottomSheet(
    //       context: context,
    //       builder: (BuildContext bc) {
    //         return Container(
    //           child: new Wrap(
    //             children: <Widget>[
    //               Text(
    //                 'What are you planning to do',
    //                 style: WhiteSansHeading,
    //               )
    //             ],
    //           ),
    //         );
    //       });
    // });
  }

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xFF26323E),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('What are you planning to do ?',
                textAlign: TextAlign.center,
                style: WhiteSansHeading.copyWith(fontSize: 30)),
            RaisedButton(
              elevation: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterDonor()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    'BECOME A DONOR',
                    style: WhiteSubtitle,
                  ),
                  Icon(Icons.exit_to_app)
                ],
              ),
            ),
            RaisedButton(
              elevation: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterDistributor()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    'BECOME A DISTRIBUTOR',
                    style: WhiteSubtitle,
                  ),
                  Icon(Icons.exit_to_app)
                ],
              ),
            ),
            RaisedButton(
              elevation: 0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPartner()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    'BECOME A PARTNER',
                    style: WhiteSubtitle,
                  ),
                  Icon(Icons.exit_to_app)
                ],
              ),
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Getting Started',
                    style: BigBoldHeading,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create an account to continue!',
                    style: GreySubtitle.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
