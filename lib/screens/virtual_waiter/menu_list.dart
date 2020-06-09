import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_menu_tile.dart';

class MenuList extends StatefulWidget {

  final Function tap;
  final bool isHome;

  MenuList({
    this.tap,
    this.isHome
  });
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    //provider to provide list of menu categories
    final menuItems = Provider.of<List<Menu>>(context) ?? [];

    return Container(
      height: 65.0,
      child: ListView.builder(
        key: Key('home-page-cat-list'),
        itemCount: menuItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return HomeMenuTile(
            index: index,
            menu: menuItems[index], 
            isHome: widget.isHome
          );
        },
      ),
    );

  }
}