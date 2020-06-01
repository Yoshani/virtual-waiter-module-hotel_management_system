import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shades/constants.dart';
import 'cart.dart';
import 'settings.dart';


class PositionForm extends StatefulWidget {
  final int subtotal;
  final int total;
  final VoidCallback onCartChanged;

  PositionForm({this.subtotal, this.total, this.onCartChanged});

  @override
  _PositionFormState createState() => _PositionFormState();
}

class _PositionFormState extends State<PositionForm> {
  int _seat;
  final _formKey = GlobalKey<FormState>();

 //generate number of seats as per table
  List<int> getSeats(){
    List<int> seats = [];
    for(int i=1; i<(Settings.table.seats)+1; i++){
      seats.add(i);
    }
    return seats;
  }

  //check device internet connectivity
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('Connected to a mobile network.');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('Connected to a wifi network.');
      return true;
    }
    return false;
  }

  //create alert
  Widget doAlert(String message){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      backgroundColor: Colors.red[400],
      title: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
      actions: [
        FlatButton(
          color: Colors.white,
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    List<int> seats=getSeats();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Please specify your seat number',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.indigo[900],
                fontWeight: FontWeight.w900,
              ),
            ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            value: _seat ?? null,
            hint: Text("Select your seat from the drop down menu"),
            decoration: textInputDecoration,
            items: seats.map((seat) {
              return DropdownMenuItem(
                value: seat,
                child: Text('Seat $seat'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _seat = val ),
          ),
          SizedBox(height: 50.0),
          RaisedButton(
            color: Colors.cyan[400],
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
                ),
            ),
            onPressed: () {
              check().then((internet) async {
                if (internet != null && internet ) {
                  print("connected");
                  if(_formKey.currentState.validate() && _seat!=null && Cart.cartItems.length>0){
                    Cart.cartItems = [];
                    widget.onCartChanged();
                    bool complete = false;
                    while(!complete){
                      Navigator.pushNamed(context, '/orderloading');
                      Timer(Duration(seconds: 10), () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {                   
                            return doAlert("Oops! Something is wrong with our connection. Please support us while we sort things out."); 
                          }
                        );
                      });
                      complete = await VWaiterDatabase2().placeOrder(
                        Cart.cartItems,
                        _seat,
                        widget.subtotal,
                        widget.total
                      );
                    }
                    Navigator.pop(context);                                   
                    Navigator.popAndPushNamed(context, '/orderStatus');
                    showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 7), () {
                          Navigator.of(context).pop(true);
                        });
                        return AlertDialog(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          title: Text(
                            "Order placed for seat $_seat",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        );
                    }); 
                  }
                }else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {                   
                      return doAlert("Please connect your device to wifi or mobile data to proceed"); 
                    }
                  );
                }                   
              });

            }
          ),
        ],
      ),
    );
  }
}