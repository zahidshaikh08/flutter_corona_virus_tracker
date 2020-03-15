import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rab_corona_virus_tracker/utils/AppRoutes.dart';
import 'package:rab_corona_virus_tracker/widgtes/wrapped_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: kToolbarHeight,
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.signUp);
                          },
                          focusColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Sign up',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
//                              style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                color: Colors.lightBlue,
//                                fontSize: 18.0,
//                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _menuPopup(),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Log in to Twitter Clone.',
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 20),
                    getPhoneLayout(),
                    SizedBox(height: 20),
                    getPasswordLayout(),
                    SizedBox(height: 25),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.forgotPassword);
                        },
                        child: Text(
                          'Forgot password?',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black45,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 5, bottom: 5),
              child: ButtonTextWrapped(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
                title: "Log in",
                backgroundColor: !valid
                    ? Theme.of(context).primaryColor.withOpacity(0.3)
                    : Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getPhoneLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone, email or username',
          style: Theme.of(context).textTheme.subtitle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
        ),
        TextFormField(
          style: TextStyle(
            color: Theme.of(context).textSelectionColor,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  getPasswordLayout() {
    var showPassword = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: Theme.of(context).textTheme.subtitle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
        ),
        StatefulBuilder(
          builder: (context, innerState) {
            return TextFormField(
              style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    showPassword = !showPassword;
                    innerState(() {});
                  },
                  child: Icon(
                    FeatherIcons.eye,
                    color: showPassword
                        ? Theme.of(context).accentColor.withOpacity(0.3)
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
              obscureText: showPassword ? true : false,
            );
          },
        ),
      ],
    );
  }

  _menuPopup() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Container(
            width: 90,
            child: Text(
              "About",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Container(
            width: 90,
            child: Text(
              "Proxy",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
      //          offset: Offset(0, 100),
      child: Icon(
        Icons.more_vert,
        color: Colors.lightBlue,
      ),
    );
  }
}
