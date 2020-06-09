import 'package:cached_network_image/cached_network_image.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  final List<Menu> menuList;
  final int index;

  ItemTile({
    @required this.item,
    this.menuList,
    this.index
    });

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {

  @override
  Widget build(BuildContext context) {
    // cached network image to set item image
    var image = CachedNetworkImage(
      imageUrl: widget.item.image,
      placeholder:(context, url) => Image.asset('assets/setloader.gif'),
      errorWidget: (context, url, error) => Image.asset('assets/setloader.gif'),
      fit: BoxFit.fill,
    );

    return InkWell(
    key: Key('item-${widget.index}'),
    onTap: (){
      print('item-${widget.index}');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context){
            return ItemsScreen(item: widget.item, menuList: widget.menuList, image: image);
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
            child: ClipOval(child:CachedNetworkImage(
              imageUrl: widget.item.image,
              placeholder:(context, url) => Image.asset('assets/miniloader.gif'),
              errorWidget: (context, url, error) => Image.asset('assets/miniloader.gif'),
              fit: BoxFit.fill,
            ),),
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


