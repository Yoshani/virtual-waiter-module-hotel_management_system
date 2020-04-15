import 'package:hotel_management_system/models/kitchen/item.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  final List<Menu> menuList;
  final dynamic image;
  ItemTile({
    @required this.item,
    this.menuList,
    this.image
    });

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  String image;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VWaiterDatabase2().getImageURL(widget.item.image),
      builder: (context, image) {
        if (!image.hasData){
          return Container();
        }
        this.image= image.data;
        return InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return ItemsScreen(item: widget.item, menuList: widget.menuList, itemImage: this.image);
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
                backgroundImage: NetworkImage(this.image),
                ),
                title:Text(
                        widget.item.name,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                subtitle:Text(
                          "Rs. ${widget.item.price.toString()}",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
              ),
                //   child: Row(
                //   children: <Widget>[
                //     SizedBox(width: 5),
                    
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       mainAxisSize: MainAxisSize.min,
                //       children: <Widget>[
                //         SizedBox(height: 10.0),
                //         Text(
                //           widget.item.name,
                //           style: TextStyle(
                //             color: Colors.blue[900],
                //             fontWeight: FontWeight.w900,
                //             fontSize: 20,
                //           ),
                //         ),
                //         Text(
                //           "Rs. ${widget.item.price.toString()}",
                //           style: TextStyle(
                //             color: Colors.blue[900],
                //             fontWeight: FontWeight.w900,
                //             fontSize: 20,
                //           ),
                //         ),
                //         SizedBox(height: 5),
                //       ],
                //     ),
                //     SizedBox(width: 5),
                //   ],
            ),
          ),
        );
      }
    );
  }
}


