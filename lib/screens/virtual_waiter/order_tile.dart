import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/order.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';

class OrderTile extends StatefulWidget {
  final Order order;

  OrderTile({this.order});
  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {

    //get image as per status or finished button if served
    Container statusImage(){
      switch (widget.order.status) {
        case "placed":
        return Container(
              width:200,
              child: Image.asset('assets/vwaiter/placed.jpg')
            );         
          break;
        case "confirmed":
        return Container(
              width:200,
              child: Image.asset('assets/vwaiter/confirmed.jpg')
            );         
          break;
        case "cooking":
        return Container(
              width:200,
              child: Image.asset('assets/vwaiter/cooking.jpg')
            );         
          break;
        case "cooked":
        return Container(
              width:200,
              child: Image.asset('assets/vwaiter/cooked.jpg')
            );         
          break;
        case "served":
        //if served, display finish button
        return Container(
                  color: Colors.white,
                  height: 80.0,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.red, 
                        width: 2.0
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Finished",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "Bring bill",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    onPressed: (){
                      VWaiterDatabase2().finishOrder(widget.order);
                      Navigator.pushNamed(context, '/feedback');
                      showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 5), () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            backgroundColor: Colors.lightBlue[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            title: Text(
                              "Thank you for dining with us. A waiter will arrive shortly",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                          );
                      });
                    },
                  ),
                );        
          break;
        default:
        return Container(
              width:200,
          );
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0,0,5.0,15.0),
      child: Container(
          height: 150.0,
          decoration: BoxDecoration(
          border: Border.all(
            color: Colors.indigo[900],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
        child: Text(
          'Seat ${widget.order.seat.toString()}',
          style: TextStyle(
            color: Colors.indigo[400],
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      statusImage(),           
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,8,0),
            child: Text(
              "Your order is ${widget.order.status}",
              style: TextStyle(
                color: Colors.indigo[900],
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
            ],
          ),
        ),
    );

  }
}