import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rab_corona_virus_tracker/services/navigator_service.dart';
import 'package:rab_corona_virus_tracker/setup_files/service_locator.dart';
import 'package:rab_corona_virus_tracker/state/auth_store.dart';
import 'package:rab_corona_virus_tracker/utils/AppRoutes.dart';
import 'package:rab_corona_virus_tracker/widgtes/circular_progress.dart';
import 'package:rab_corona_virus_tracker/widgtes/wrapped_button.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            getAppBar(),
            Expanded(
              child: getMainLayout(),
            ),
            getBottomLayout(),
          ],
        ),
      ),
    );
  }

  onIdleState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Create your Account',
          style: Theme.of(context).textTheme.body2.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - (kToolbarHeight * 4),
              child: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getNameTextField(),
                    SizedBox(height: 20),
                    getPhoneTextField(),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  onSuccessState() {
    return SizedBox();
  }

  onErrorWidget(String error) {
    print('on error called');

    return Center(
      child: Text(error),
    );
  }

  getAppBar() {
    return Container(
      alignment: Alignment.center,
      height: kToolbarHeight,
      child: Stack(
        children: <Widget>[
          IconButton(
            onPressed: () {
              getIT<NavigationService>().onBackPressed(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.lightBlue,
            ),
          ),
          Center(
            child: Icon(
              FontAwesomeIcons.twitter,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }

  getMainLayout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: StateBuilder<AuthStore>(
        tag: 'sign_up',
        models: [Injector.getAsReactive<AuthStore>()],
        builder: (context, reactiveModel) {
          return reactiveModel.whenConnectionState(
            onIdle: () => onIdleState(),
            onWaiting: () => CircularLoader(),
            onData: (store) {
              print('on success');

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              });
              return onSuccessState();
            },
            onError: (_) => onErrorWidget("error"),
          );
        },
      ),
    );
  }

  getBottomLayout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: kToolbarHeight,
      child: Column(
        children: <Widget>[
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Text(
                  'Use email instead',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              ButtonTextWrapped(
                onTap: () {
                  signUpTwitterCloneUser(context);
                },
                title: "Sign up",
                backgroundColor: Colors.lightBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  var nameRemain = "50";

  getNameTextField() {
    var validName = false;

    return StatefulBuilder(
      builder: (context, innerState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              maxLength: 50,
              style: Theme.of(context).textTheme.body2.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
              validator: validateEmail,
              onChanged: onNameTextChanged,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle:
                    Theme.of(context).textTheme.subtitle.copyWith(fontSize: 20),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
                suffixIcon: validName
                    ? Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: SvgPicture.asset(
                          "assets/icons/right.svg",
                          color: Colors.greenAccent,
                          width: 1,
                          height: 1,
                        ),
                      )
                    : null,
              ),
              keyboardType: TextInputType.text,
            ),
          ],
        );
      },
    );
  }

  onNameTextChanged(value) {}

  getPhoneTextField() {
    var validPassword = false;
    return StatefulBuilder(builder: (context, innerState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _passwordController,
            style: Theme.of(context).textTheme.body2.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
            validator: validatePassword,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle:
                  Theme.of(context).textTheme.subtitle.copyWith(fontSize: 20),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              suffixIcon: validPassword
                  ? Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: SvgPicture.asset(
                        "assets/icons/right.svg",
                        color: Colors.greenAccent,
                        width: 1,
                        height: 1,
                      ),
                    )
                  : null,
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      );
    });
  }

  onPasswordChanged(value) {}

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 4)
      return 'Enter Valid Password';
    else
      return null;
  }

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      //    If all data are correct then save data to out variables
      _formKey.currentState.save();
      return true;
    } else {
      //    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });

      return false;
    }
  }

  signUpTwitterCloneUser(BuildContext context) {
    if (_validateInputs()) {
      final reactiveModel = Injector.getAsReactive<AuthStore>();
      reactiveModel.setState(
        (store) => store.createTwitterAccount(
          _emailController.text.toString(),
          _passwordController.text.toString(),
        ),
        filterTags: ['sign_up'],
        onError: (context, error) {
          if (error is NetworkError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Couldn't fetch weather. Is the device online?"),
              ),
            );
          } else {
            throw error;
          }
        },
      );
    }
  }
}

class NetworkError extends Error {}
