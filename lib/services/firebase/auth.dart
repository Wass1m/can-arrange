import 'package:canaarange/models/distributor.dart';
import 'package:canaarange/models/partner.dart';
import 'package:canaarange/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  User getUser() => _auth.currentUser;

  Stream<User> get user => _auth.authStateChanges();

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(
      String email,
      String password,
      String firstName,
      String lastName,
      String country,
      String province,
      String type) async {
    print(email);
    print(password);
    print(firstName);
    print(lastName);
    print(country);
    print(province);
    print(type);
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      Profile profile = Profile(
          firstName: firstName,
          lastName: lastName,
          country: country,
          province: province,
          type: type);

      await _db.collection('profiles').doc(user.uid).set(profile.toMap());

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPasswordDistributor(
      String email,
      String password,
      String firstName,
      String lastName,
      String country,
      String province,
      String position,
      String institution,
      String number,
      String category,
      String address,
      String type) async {
    print(email);
    print(password);
    print(firstName);
    print(lastName);
    print(country);
    print(province);
    print(type);
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      Profile profile = Profile(
          firstName: firstName,
          lastName: lastName,
          country: country,
          province: province,
          type: type);

      await _db.collection('profiles').doc(user.uid).set(profile.toMap());

      Distributor distri = Distributor(
          position: position,
          institution: institution,
          number: number,
          category: category,
          address: address);

      await _db.collection('distributors').doc(user.uid).set(distri.toMap());

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPasswordPartner(
      String email,
      String password,
      String firstName,
      String lastName,
      String country,
      String province,
      String legalName,
      String vatNumber,
      String vatID,
      String category,
      String type) async {
    print(email);
    print(password);
    print(firstName);
    print(lastName);
    print(country);
    print(province);
    print(type);
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      Profile profile = Profile(
          firstName: firstName,
          lastName: lastName,
          country: country,
          province: province,
          type: type);

      await _db.collection('profiles').doc(user.uid).set(profile.toMap());

      Partner partner = Partner(
        legalName: legalName,
        vatNumber: vatNumber,
        vatID: vatID,
        category: category,
      );

      await _db.collection('partners').doc(user.uid).set(partner.toMap());

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    try {
      User user;

      final GoogleSignInAccount account = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredentials =
          await _auth.signInWithCredential(credential);

      user = userCredentials.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> signUpWithGoogle() async {
    try {
      GoogleSignInAccount account = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;

      var profile = await _db.collection('profiles').doc(user.uid).get();
      print('EXISTS EXISTSLASDKLAKDL;AKDADADLKAL;DK;ALSKDL;AKDL;KSDDKSLD');
      print(profile);
      if (profile.data() == null) {
        print('DOEST EXIST');
        await _db.collection('profiles').doc(user.uid).set({
          'fullName': user.displayName,
          'avatar': user.photoURL,
        });
      }

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut().then((_) {
        _googleSignIn.signOut();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
