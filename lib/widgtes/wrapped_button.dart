import 'package:flutter/material.dart';

class ButtonTextWrapped extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final onTap;

  const ButtonTextWrapped(
      {Key key,
      @required this.title,
      this.backgroundColor,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.lightBlue,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
