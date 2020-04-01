import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_management_system/services/orderManager_database.dart';
import 'package:provider/provider.dart';
import 'package:hotel_management_system/models/orderManager/Order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TableView extends StatelessWidget {
  final tableNo;

  TableView({this.tableNo});

  Widget _buildBottomRow() => Row(
        children: [
          Container(
            child: Text("row bottom"),
          )
        ],
      );

  Widget build(BuildContext context) {
    return StreamBuilder<List>(
        stream: OrderManagerDatabase(tableNo: tableNo).orders,
        builder: (context, snapshot) {
          return Container(
              color: Colors.blue,
              width: 200,
              height: 200,
              alignment: Alignment.center,
              margin: EdgeInsets.all(6),
              child: Column(children: <Widget>[
                _buildBottomRow(),
              ]));
        });
  }
}
