import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shades/constants.dart';
import 'bottom_nav_bar.dart';
import 'cart.dart';
import 'cart_tile.dart';
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

  List<int> getSeats(){
    List<int> seats = [];
    for(int i=0; i<Settings.table.seats; i++){
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
          DropdownButtonFormField(
            value: _seat ?? null,
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
            onPressed: () async {
              if(_formKey.currentState.validate() && _seat!=null){
                await VWaiterDatabase2().placeOrder(
                  Cart.cartItems,
                  _seat,
                  widget.subtotal,
                  widget.total
                );
                Cart.cartItems = [];
                widget.onCartChanged();
                Navigator.pop(context);
              }
            }
          ),
        ],
      ),
    );
  }
}