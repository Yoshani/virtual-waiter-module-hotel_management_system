import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/shared/constants.dart';
import 'package:hotel_management_system/shared/error_alert.dart';
import 'package:hotel_management_system/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/shared/check_internet_connectivity.dart';


class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.5,
        title: Text('Sign in to Virtual Waiter', 
                style: TextStyle(color: Colors.indigo[900]),),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 110.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                key: Key('enter-email'),
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: EmailFieldValidator.validate,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                key: Key('enter-password'),
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: PasswordFieldValidator.validate,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 40.0),
              RaisedButton(
                key: Key('signin'),
                color: Colors.cyan[400],
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                ),
                onPressed: () {
                  check().then((internet) async {
                    if (internet != null && internet ) {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            loading = false;
                            error = 'Could not sign in with those credentials';
                          });
                        }
                      }
                    }else{
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {                   
                        return doAlert("Please connect your device to wifi or mobile data to proceed", context); 
                    });
                    }                   
                });
              }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 17.0),
              ),
              Expanded(child: Image.asset('assets/vegies.jpg'))
            ],
          ),
        ),
      ),
    );
  }
}