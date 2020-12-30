import 'package:canaarange/models/profile.dart';
import 'package:canaarange/screens/auth/welcome_screen.dart';
import 'package:canaarange/screens/home/DistrubutorHome.dart';
import 'package:canaarange/screens/home/DonorHome.dart';
import 'package:canaarange/screens/home/PartnerHome.dart';
import 'package:canaarange/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperUser extends StatefulWidget {
  @override
  _WrapperUserState createState() => _WrapperUserState();
}

class _WrapperUserState extends State<WrapperUser> {
  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<Profile>(context);

    return profile == null ? WelcomeScreen() : Wrapper();
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<Profile>(context);
    return profile == null
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : profile.type == "Donor"
            ? DonorHome()
            : profile.type == "Distributor"
                ? DistriHome()
                : profile.type == "Partner"
                    ? PartnerHome()
                    : Scaffold(
                        body: Center(child: Text('something went wrong')));
  }
}
