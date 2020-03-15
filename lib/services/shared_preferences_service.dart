import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwitterSharedPreference {
  final BuildContext context;
  SharedPreferences preferences;

  TwitterSharedPreference({this.context}) {
    initView();
  }

  void initView() async {
    preferences = await SharedPreferences.getInstance().then((prefs) {
      print('preferences initialized successfully.');
    }).catchError((onError) {
      print(
          'error in initializing shared prefrences ===>> ${onError.toString()}');
    });
  }
}
