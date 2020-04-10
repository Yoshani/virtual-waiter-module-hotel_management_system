import 'package:hotel_management_system/models/kitchen/item.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
      child: InkWell(
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
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      widget.item.name,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Rs. ${widget.item.price.toString()}",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
      ),
    ),
        );
    // return RaisedButton(
    //     onPressed: () {},
    //     textColor: Colors.white,
    //     padding: const EdgeInsets.all(70.0),
    //     child: Container(
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: <Color>[
    //             Color(0xFF0D47A1),
    //             Color(0xFF1976D2),
    //             Color(0xFF42A5F5),
    //           ],
    //         ),
    //       ),
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         menuItem.name,
    //         style: TextStyle(fontSize: 20)
    //       ),
    //     ),
    //   );
  }
}


