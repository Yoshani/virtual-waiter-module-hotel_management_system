import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/item.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/home_menu_tile.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shades/loading.dart';
import 'item_tile.dart';


class CategoriesScreen extends StatefulWidget {
  final String category;
  final Menu menu;


  CategoriesScreen({this.category, this.menu});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  Menu menu;
  var image;
  // List<MenuItem> menuItems;
  List<String> catItemsIdList = [];
  List<Item> categoryItemList = [];
  List<Item> itemList2;
  final AuthService _auth = AuthService();

// void addItemId() {
//   menu.menuItems.forEach((menuItem) {
//     catItemsIdList.add(menuItem.itemId);
//   });
// }
// Future getImage() async {
//   var result = await VWaiterDatabase2().getImageURL(menu.imageName); 
//     image = result;
//   return image;
// }

  @override
  initState() {
    menu = widget.menu;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Menu>>(
      stream: VWaiterDatabase2().menu,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Menu> menuList = snapshot.data;
          return StreamBuilder<List<Item>>(
            stream: VWaiterDatabase2().getItemList(menu.category),
            builder: (context, snapshot) {
              if(snapshot.hasData ){
                List<Item> itemList = snapshot.data;             
                return FutureBuilder(
                  future: VWaiterDatabase2().getImageURL(menu.imageName),
                  builder: (context, image) {
                    if (!image.hasData){
                      return Loading();
                    }
                    return Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        leading: IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace,
                            color: Colors.black,
                          ),
                            onPressed: () => Navigator.popUntil(
                              context,
                              ModalRoute.withName('/'),
                            ),
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
                                  itemCount: menuList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return HomeMenuTile(
                                      isHome: false,
                                      menu: menuList[index],
                                      tap: () {
                                      setState((){
                                        menu=menuList[index];
                                      });
                                      }
                                    );
                                  },
                                ),
                              ),
                                  
                            Divider(),
                            SizedBox(height: 20.0),
                            Text(
                              menu.category,
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            FadeInImage.assetNetwork(
                              placeholder: 'assets/loader.gif',
                              image: image.data,
                              fit: BoxFit.fill,
                              height: 400,
                            ),
                            
                            SizedBox(height: 10.0),
                          
                            Container(
                              height: 250.0,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: itemList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                return ItemTile(
                                  item: itemList[index],
                                  image: Container(),
                                  menuList: menuList
                                );
                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
                );
              }else{
                return Loading();
              }
            }
          );
        }else{
          return Loading();
        }
      }
    );
  }
}
