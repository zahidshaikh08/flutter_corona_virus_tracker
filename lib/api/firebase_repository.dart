import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rab_corona_virus_tracker/data/model/twitter_user.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final userReference = "ALL_USERS";
final timelineReference = "TIMELINE";

class FirebaseRepository {
  static Future<TwitterUser> createAccount(
      String email, String password) async {
    var twitterUser;

    await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((authResult) {
      final firebaseUser = authResult.user;

      print('user email ===>> ${firebaseUser.email}');
      print('user uid ===>> ${firebaseUser.uid}');
      if (firebaseUser != null) {
        Firestore.instance.collection(userReference).document().setData(
          {
            'userId': firebaseUser.uid,
            'userName': '',
            'firstName': '',
            'lastName': '',
            'dateOfBirth': '',
            'mobileNumber': '',
            'email': email,
            'password': password,
            'profileUrl': '',
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
            'address1': '',
            'address2': '',
            'city': '',
            'state': '',
            'country': '',
            'postalCode': '',
            'profession': '',
          },
        ).then((onValue) {
          twitterUser = TwitterUser(email: email, password: password);
          return twitterUser;
        }).catchError((_) {
          return twitterUser;
        });
      } else {
        return twitterUser;
      }
    });

    return twitterUser;
  }

  static Future<TwitterUser> login(String email, String password) async {
    var twitterUser;

    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (user != null) {
      Firestore.instance
          .collection(userReference)
          .document(user.uid)
          .get()
          .then((DocumentSnapshot ds) {
        twitterUser = TwitterUser.fromJson(ds.data);
        return twitterUser;
      });
    } else {
      return twitterUser;
    }

    return twitterUser;
  }
}

class NetworkError extends Error {}
