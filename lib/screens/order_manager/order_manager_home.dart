import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/order_manager/table.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/orderManager_database.dart';
import 'package:hotel_management_system/models/orderManager/Order.dart';
import 'package:provider/provider.dart';

class OrderManagerHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
  

    return StreamBuilder<List<Tables>>(
        stream: OrderManagerDatabase().tables,
        builder: (context, snapshot) {
    // print(snapshot.data.length);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order manager'),
        backgroundColor: Colors.white,
        elevation: 1.5,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: GridView.builder(
          // padding: EdgeInsets.all(15.0),
          // crossAxisCount: 2,
          // crossAxisSpacing: 10,
          // childAspectRatio: 1,
          // children: _list.map((value) {
          //   print(_list[2]['id']);
          //   return Container(
          //     width: 200,
          //     height: 200,
          //     alignment: Alignment.center,
          //     margin: EdgeInsets.all(8),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.black),
          //     ),
          //     child: Text("_list[index]"),
          //   );
          // }).toList(),
          itemCount: snapshot.data.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return  TableView(tableNo:index+1);
            // return Text('${_list[index]['name'].runtimeType}');
          }),
    );
        }
      );
  }
}