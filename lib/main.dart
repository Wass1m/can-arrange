import 'package:canaarange/screens/auth/welcome_screen.dart';
import 'package:canaarange/services/firebase/auth.dart';
import 'package:canaarange/services/firebase/global.dart';
import 'package:canaarange/styles/theme.dart';
import 'package:canaarange/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        StreamProvider<Profile>.value(value: Global.profileRef.documentStream),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: WrapperUser(),
    );
  }
}
