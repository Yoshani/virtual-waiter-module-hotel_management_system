import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';


class ItemTile extends StatelessWidget {
  final ItemData item;
  ItemTile({this.item});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        // color: Colors.blue[70],
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[50],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(item.description),
          subtitle: Text(' Rs ${item.price}.00 '),
          isThreeLine: true,
          selected: true,
          // onTap: ()=>{selected=true},/
        ),
        elevation: 1.5,
        color: Colors.white70,
      ),
    );
  }
}
