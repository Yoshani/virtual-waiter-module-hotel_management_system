import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  final List<Menu> menuList;

  ItemTile({
    @required this.item,
    this.menuList,
    });

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context){
            return ItemsScreen(item: widget.item, menuList: widget.menuList);
          },
        ),
      );
    },
    child: Card(
        color: Colors.white,
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(widget.item.image),
            ),
            title:Text(
              widget.item.name,
              style: TextStyle(
                color: Colors.indigo[900],
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            subtitle:Text(
              "Rs. ${widget.item.price.toString()}",
              style: TextStyle(
                color: Colors.indigo[900],
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );

  }
}


