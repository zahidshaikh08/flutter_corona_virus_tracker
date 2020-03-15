import 'package:flutter/material.dart';
import 'package:rab_corona_virus_tracker/services/navigator_service.dart';
import 'package:rab_corona_virus_tracker/setup_files/service_locator.dart';

class MyAppBar extends StatelessWidget {
  final centerIcon;
  final color;

  const MyAppBar({Key key, this.centerIcon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                getIT<NavigationService>().onBackPressed(context);
              },
              child: Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Center(
              child: Icon(
                centerIcon,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
