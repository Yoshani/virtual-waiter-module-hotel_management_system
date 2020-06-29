import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/shared/check_internet_connectivity.dart';
import 'package:hotel_management_system/shared/constants.dart';
import 'package:hotel_management_system/shared/error_alert.dart';
import 'package:hotel_management_system/shared/loading.dart';
import 'package:flutter/material.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.length < 6 ? 'Enter a password 6+ characters long' : null;
  }
}


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: Text('Register to Virtual Waiter', style: TextStyle(color: Colors.indigo[900]),),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
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
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: EmailFieldValidator.validate,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: PasswordFieldValidator.validate,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 40.0),
              RaisedButton(
                color: Colors.cyan[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () {
                  check().then((internet) async {
                    if (internet != null && internet ) {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            loading = false;
                            error = 'Please supply a valid email';
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