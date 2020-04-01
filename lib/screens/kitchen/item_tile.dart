import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class ItemTile extends StatefulWidget {
  final ItemData item;
  const ItemTile({Key key, this.item}) : super(key: key);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool available;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: Card(
        // color: Colors.blue[70],
        // margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        // child: ListTile(
        //   leading: CircleAvatar(
        //     radius: 25.0,
        //     backgroundColor: Colors.brown[50],
        //     backgroundImage: AssetImage('assets/coffee_icon.png'),
        //   ),
        //   title: Text(item.description),
        //   subtitle: Text(' Rs ${item.price}.00 '),
        //   isThreeLine: true,
        //   selected: true,

        //   // onTap: ()=>{selected=true},/
        // ),

        child: Row(children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Text(widget.item.description)),
          SizedBox(width: 20),
          // Align(alignment: Alignment.topLeft, child: Text('${item.price}')),

          Transform.scale(
            scale: 0.5,
            child: LiteRollingSwitch(
              //initial value
              value: widget.item.available,
              textOn: '   ADD',
              textOff: 'Remove',
              colorOn: Colors.greenAccent[700],
              colorOff: Colors.redAccent[700],
              iconOn: Icons.done,
              iconOff: Icons.remove_circle_outline,
              textSize: 18.0,
              onChanged: (bool state) {
                //Use it to manage the different states
                // setState(() => available = state);
              },
            ),
          ),
        ]),

        elevation: 2.5,
        color: Colors.white,
      ),
    );
  }
}
