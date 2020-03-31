import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eluminousmobile/constants/k_login_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  Text(
                    "eLuminous",
                    style: kHeaderTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Welcome Back",
                    style: kSubHeaderTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: fStackedBoxDecoration,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 13.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: fBaseOfInputsBoxDecoration,
                                  child: TextFormField(
                                    decoration: fInputEmailDecoration,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey[900],
                                  height: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: fBaseOfInputsBoxDecoration,
                                  child: TextFormField(
                                    decoration: fInputPasswordDecoration,
                                    obscureText: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'No Account? Sign Up',
                              style: fSecondaryButtonDecoration,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO: Save Form
                              print('Form Saved');
                            },
                            child: Container(
                              height: 50.0,
                              margin: EdgeInsets.symmetric(
                                horizontal: 60.0,
                              ),
                              decoration: fSignInButtonDecoration,
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
                            ),
                          ),
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
