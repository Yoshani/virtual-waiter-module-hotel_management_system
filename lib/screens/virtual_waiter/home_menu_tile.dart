import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/category.dart';

class HomeMenuTile extends StatefulWidget {

  final Menu menu;
  final Function tap;
  final bool isHome;
  final int index;

  HomeMenuTile({
    @required this.menu,
    this.tap,
    this.isHome,
    this.index
    });

  @override
  _HomeMenuTileState createState() => _HomeMenuTileState();
}

class _HomeMenuTileState extends State<HomeMenuTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
      child: InkWell(
      key: Key('homebutton-${widget.index}'), //key index is given a value only if it is called from vwaiter hompage, otherwise null
      onTap: widget.isHome?(){
        print('homebutton-${widget.index}');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              return CategoriesScreen(
                index: widget.index,
                menu: widget.menu,
              );
            },
          ),
        );
      }:widget.tap,
      child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          color: Colors.cyan[400],
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
                      widget.menu.category,
                      style: TextStyle(
                        color: Colors.white,
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
  }
}


