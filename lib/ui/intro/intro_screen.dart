import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rab_corona_virus_tracker/utils/AppRoutes.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              Container(
                height: kToolbarHeight,
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "See what's happening",
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "in the world right now.",
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signUp);
                          },
                          child: Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: kToolbarHeight,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Have an account already? ",
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.3,
                          ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Log in",
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.5,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
