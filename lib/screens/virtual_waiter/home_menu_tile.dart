import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:hotel_management_system/models/kitchen/menuItem.dart';
import 'package:flutter/material.dart';

class HomeMenuTile extends StatelessWidget {

  final Menu menuItem;
  HomeMenuTile({ this.menuItem });

  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
          child: InkWell(
      // onTap: widget.isHome?(){
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (BuildContext context){
      //         return CategoriesScreen();
      //       },
      //     ),
      //   );
      // }:widget.tap,
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
                      menuItem.category,
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


