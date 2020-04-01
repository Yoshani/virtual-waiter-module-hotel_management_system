import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Order {
  final String status;
  final int total;
  final  Timestamp datetime;
  final List  orderItems;
  final int seat;
  // final String table;
  Order({this.status, this.datetime,this.orderItems,this.total,this.seat});
}

class Tables {
  final int tableNo;

  Tables({this.tableNo});
}

class TableData{
  final int tableNo;
  final List<Order> orders;
  TableData({this.tableNo,this.orders});
}
