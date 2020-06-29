import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/home_menu_tile.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shared/loading.dart';
import 'bottom_nav_bar.dart';
import 'item_tile.dart';


class CategoriesScreen extends StatefulWidget {

  final Menu menu;
  final int index;


  CategoriesScreen({this.menu, this.index});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  Menu menu;
  var image;
  List<String> catItemsIdList = [];
  List<Item> categoryItemList = [];
  List<Item> itemList2;

  @override
  initState() {
    menu = widget.menu;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    //stream of menu items
    return StreamBuilder<List<Menu>>(
      stream: VWaiterDatabase2().menu,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Menu> menuList = snapshot.data;

          //stream of category items
          return StreamBuilder<List<Item>>(
            stream: VWaiterDatabase2().getItemList(menu.category),
            builder: (context, snapshot) {
              if(snapshot.hasData ){
                List<Item> itemList = snapshot.data;             
                return Scaffold(
                  resizeToAvoidBottomPadding: false,
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
                            color: Colors.indigo[900],
                            fontFamily: 'Consolas',
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: MediaQuery.of(context).size.width,
                          child:CachedNetworkImage(
                            imageUrl: menu.image,
                            placeholder:(context, url) => Image.asset('assets/catloader.gif'),
                            errorWidget: (context, url, error) => Image.asset('assets/catloader.gif'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        
                        SizedBox(height: 10.0),
                      
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            key: Key('category-list-${widget.index}'),
                            scrollDirection: Axis.vertical,
                            itemCount: itemList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                            return ItemTile(
                              index: index,
                              item: itemList[index],
                              menuList: menuList
                            );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                  bottomNavigationBar: BottomNavigation(),
                  floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.cyan[400],
                    elevation: 8.0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Image.asset('assets/logo.png'),
                    ),
                    onPressed: (){},
                  ),
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
