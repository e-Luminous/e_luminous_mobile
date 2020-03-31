import 'package:eluminousmobile/animations/fade_animator.dart';
import 'package:eluminousmobile/constants/k_login_screen.dart';
import 'package:eluminousmobile/screens/login_screen.dart';
import 'package:eluminousmobile/themes/light_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formState = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  String _interactivePhoneNumber;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _interactivePhoneNumber = '';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void createUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          child: Container(
            height: 200,
            width: width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: 30,
                    right: -100,
                    child: _circularContainer(300, Colors.deepPurpleAccent)),
                Positioned(
                    top: -100,
                    left: -45,
                    child:
                        _circularContainer(width * .5, Colors.deepPurple[600])),
                Positioned(
                    top: -180,
                    right: -30,
                    child: _circularContainer(width * .7, Colors.transparent,
                        borderColor: Colors.white38)),
                Positioned(
                  top: 40,
                  left: 0,
                  child: FadeAnimation(
                    delay: 1.0,
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "eLuminous",
                                style: TextStyle(
                                    fontFamily: 'Righteous',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.school,
                                color: Colors.white,
                                size: 50,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Registration",
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Righteous',
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 480.0,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: FadeAnimation(
            delay: 1.9,
            child: Form(
              key: _formState,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  _entryField(
                    'Email',
                    context,
                    controller: _emailController,
                    labelIcon: Icons.mail,
                  ),
                  _entryField(
                    'Password',
                    context,
                    controller: _passwordController,
                    isPassword: true,
                    labelIcon: Icons.vpn_key,
                  ),
                  _entryField(
                    'Confirm Password',
                    context,
                    controller: _confirmPasswordController,
                    isPassword: true,
                    labelIcon: Icons.vpn_key,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InternationalPhoneNumberInput.withCustomDecoration(
                      onInputChanged: (PhoneNumber number) {
                        setState(() {
                          _interactivePhoneNumber = number.toString();
                        });
                      },
                      onSubmit: () {
                        print(_interactivePhoneNumber);
                      },
                      isEnabled: true,
                      autoValidate: false,
                      formatInput: true,
                      initialCountry2LetterCode: 'BD',
                      inputDecoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          borderSide: BorderSide(style: BorderStyle.none),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 45.0,
                    ),
                    child: RaisedButton(
                      color: Colors.deepOrangeAccent[200],
                      splashColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
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
                            "Sign Up",
                            style: kSignInButtonTextStyle,
                          ),
                        ],
                      ),
                      onPressed: createUser,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'Already\'ve Account? Sign In',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Righteous',
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _entryField(String hint, BuildContext context,
    {IconData labelIcon,
    TextEditingController controller,
    bool isPassword = false}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
      obscureText: isPassword,
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter a valid ${hint.toString()}';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: Icon(
          labelIcon,
        ),
        hintText: hint,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    ),
  );
}

Widget _circularContainer(double height, Color color,
    {Color borderColor = Colors.transparent, double borderWidth = 2}) {
  return Container(
    height: height,
    width: height,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
    ),
  );
}
