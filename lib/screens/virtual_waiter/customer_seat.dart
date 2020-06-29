import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shared/check_internet_connectivity.dart';
import 'package:hotel_management_system/shared/constants.dart';
import 'package:hotel_management_system/shared/error_alert.dart';
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
          //drop down menu to request seat number
          DropdownButtonFormField(
            key: Key('dropdownbuttonformfield'),
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
            key: Key('submit'),
            color: Colors.cyan[400],
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
                ),
            ),
            onPressed: () {
              //check device connectivity method imported
              check().then((internet) async {
                if (internet != null && internet ) {
                  //check if seat and cart is not empty
                  if(_formKey.currentState.validate() && _seat!=null && Cart.cartItems.length>0){
                  Navigator.pushNamed(context, '/orderloading');
                  bool complete = false;                  
                  while(!complete){  
                    //alert display if loading screen exists for too long                 
                    Timer(Duration(seconds: 10), () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {                   
                          return doAlert("Oops! Something is wrong with our network connection. Your order will be placed once connection is regained.", context); 
                        }
                      );
                    });
                    //place order in database
                    complete = await VWaiterDatabase2().placeOrder(
                      Cart.cartItems,
                      _seat,
                      widget.subtotal,
                      widget.total
                    );
                  }

                  Cart.cartItems = [];
                  widget.onCartChanged();
                  Navigator.pop(context);                                   
                  Navigator.popAndPushNamed(context, '/orderStatus');
                  showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 7), () {
                        Navigator.of(context).pop(true);
                      });
                      //order placed alert
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
                      return doAlert("Please connect your device to wifi or mobile data to proceed",context); 
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