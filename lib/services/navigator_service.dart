import 'package:flutter/cupertino.dart';

class NavigationService {
  final BuildContext context;

  NavigationService({this.context}) {
    initView();
  }

  void initView() {}

  onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}
