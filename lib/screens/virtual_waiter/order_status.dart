import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/order.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shared/loading.dart';
import 'bottom_nav_bar.dart';
import 'order_tile.dart';

class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Order>>(
      stream: VWaiterDatabase2().getOrderList(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Loading();
        }
        //list of orders placed from table
        List<Order> orderList = snapshot.data;
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          appBar: AppBar(   
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ),
                onPressed: () => Navigator.pop(context)
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1.5,
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                      )
                    ),
                    child: Text(
                      "          Your Order Status        ",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      ),
                    )
                  ),
                ),
                SizedBox(height: 50.0),

                //display no orders if order list is empty
                orderList.isEmpty?
                Column(
                children: <Widget>[
                  Center(
                    child: 
                    Text(
                      "This table has no orders yet!",
                      style: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Text(
                      "Place your order now",
                      style: TextStyle(
                      color: Colors.indigo[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "We are waiting to cook your favourite meal!",
                      style: TextStyle(
                      color: Colors.indigo[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                  child: Image.asset(
                    "assets/vwaiter/placeOrder.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                ],
              )
              //display order status if available
                :Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Orders placed are displayed according to your seat number.",
                          style: TextStyle(
                          color: Colors.indigo[900],
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          "Once you are done with your meal, be sure to click finished.",
                          style: TextStyle(
                          color: Colors.indigo[500],
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height:5.0),
                      Center(
                        child: Text(
                          "We will be at your service in no time!",
                          style: TextStyle(
                          color: Colors.indigo[500],
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 45.0),
                      Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                      itemCount: orderList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return OrderTile(
                          order: orderList[index], 
                        );
                      },
                          ),
                        )
                    ],
                  ),             
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigation(),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan[400],
            elevation: 8.0,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Image.asset('assets/logo.png'),
            ),
            onPressed: (){},
          ),
        );
      }
    );
  }
}