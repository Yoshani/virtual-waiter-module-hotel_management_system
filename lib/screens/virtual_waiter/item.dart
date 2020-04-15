import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/item.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/home_menu_tile.dart';
import 'package:hotel_management_system/services/auth.dart';


class ItemsScreen extends StatefulWidget {
  final Item item;
  final List<Menu> menuList;
  final dynamic itemImage;

  ItemsScreen({this.item, this.menuList, this.itemImage});
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  int quantity;

  final AuthService _auth = AuthService();

  void add(){
    quantity++;
  }

  void subtract(){
    if(quantity != 0){
      quantity--;
    }
  }

  @override
  void initState() {
    quantity=0;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                  onPressed: () => Navigator.pop(context),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 1.5,
              actions: <Widget>[PopupMenuButton<Widget>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child:  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Logout'),
                    onPressed: () async {
                      Navigator.pop(context);
                      await _auth.signOut();
                    },
                  ),
                ),
              ],
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              )  
              ),
              ],
            ),

            body: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                    Container(
                      height: 65.0,
                      child: ListView.builder(
                        itemCount: widget.menuList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HomeMenuTile(
                            menu: widget.menuList[index], 
                            isHome: true
                          );
                        },
                      ),
                    ), 
                                            
                  Divider(),
                  SizedBox(height: 20.0),
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      widget.item.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,                     
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                        placeholder: 'assets/loader.gif',
                        image: widget.itemImage,
                        fit: BoxFit.fill,
                        height: 300,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[                               
                                Text(
                                  "Rs. ${widget.item.price.toString()}",
                                  style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "Persons: ${widget.item.persons.toString()}",
                                  style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Quantity $quantity",
                                      style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 23,
                                      fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => setState((){
                                            add();
                                          })
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => setState((){
                                            subtract();
                                          })
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
