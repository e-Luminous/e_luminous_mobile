import 'package:eluminousmobile/animations/fade_animator.dart';
import 'package:eluminousmobile/models/user_login.dart';
import 'package:eluminousmobile/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eluminousmobile/constants/k_login_screen.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFocusNode = FocusNode();
  final _formState = GlobalKey<FormState>();
  var _userLogin = UserLogin(userEmail: '', userPassword: '');

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void authenticate() {
    final isValid = _formState.currentState.validate();
    if (!isValid) {
      return;
    }
    _formState.currentState.save();
    print(_userLogin.userEmail);
    print(_userLogin.userPassword);
    // TODO: Authenticate Credentials By Sending To The Server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: fBaseBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FadeAnimation(
                        delay: 1.0,
                        child: Text(
                          "eLuminous",
                          style: kHeaderTextStyle,
                        ),
                      ),
                      FadeAnimation(
                        delay: 1.0,
                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 100.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  FadeAnimation(
                    delay: 1.3,
                    child: Text(
                      "Welcome Back",
                      style: kSubHeaderTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: fStackedBoxDecoration,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Form(
                    key: _formState,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                          ),
                          FadeAnimation(
                            delay: 1.6,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 14.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: fBaseOfInputsBoxDecoration,
                                    child: TextFormField(
                                      decoration: fInputEmailDecoration,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (value) =>
                                          FocusScope.of(context)
                                              .requestFocus(_passwordFocusNode),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please, Enter an e-mail';
                                        }
                                        return null;
                                      },
                                      onSaved: (emailValue) {
                                        _userLogin = UserLogin(
                                          userEmail: emailValue,
                                          userPassword: _userLogin.userPassword,
                                        );
                                      },
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.pink[900],
                                    height: 20.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: fBaseOfInputsBoxDecoration,
                                    child: TextFormField(
                                      decoration: fInputPasswordDecoration,
                                      obscureText: true,
                                      focusNode: _passwordFocusNode,
                                      textInputAction: TextInputAction.done,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Password';
                                        }
                                        return null;
                                      },
                                      onSaved: (passwordValue) {
                                        _userLogin = UserLogin(
                                          userEmail: _userLogin.userEmail,
                                          userPassword: passwordValue,
                                        );
                                      },
                                      onFieldSubmitted: (_) {
                                        authenticate();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          FadeAnimation(
                            delay: 1.9,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    RegistrationScreen.routeName);
                              },
                              child: Text(
                                'No Account? Sign Up',
                                style: fSecondaryButtonDecoration,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FadeAnimation(
                            delay: 1.9,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: RaisedButton(
                                color: Colors.deepOrangeAccent[200],
                                splashColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(28.0),
                                ),
                                padding: EdgeInsets.all(15.0),
                                elevation: 10.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Sign In",
                                      style: kSignInButtonTextStyle,
                                    ),
                                  ],
                                ),
                                onPressed: authenticate,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
