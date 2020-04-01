import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:hotel_management_system/models/kitchen/menuItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_menu_tile.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {

    final menuItems = Provider.of<List<Menu>>(context) ?? [];

    return Container(
      height: 65.0,
      child: ListView.builder(
        itemCount: menuItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return HomeMenuTile(menuItem: menuItems[index]);
        },
      ),
    );

  }
}