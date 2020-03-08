import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EditMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Menu',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1.5,
        ),
        body: Container(
          child: Center(
            child: Column(
              // mainAxisAlignment: max,
              children: <Widget>[
                Container(
                  // elevation: 15,

                  height: 200,
                  width: 300,
                  // child: Card(
                  child: InkWell(
                    onTap: () {
                      print('1556');
                    },
                    child: ClipRRect(
                      borderRadius: (BorderRadius.circular(20.0)),
                      child: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          'assets/friedrice.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  margin: EdgeInsets.all(10),
                  // ),
                ),
                Container(
                  height: 200,
                  width: 300,
                  child: Card(
                    child: InkWell(
                      onTap: () {},
                      child: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          'assets/avacado-juise.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(70.0),
                    // ),
                    elevation: 15,
                    margin: EdgeInsets.all(10),
                  ),
                ),
                Container(
                  height: 200,
                  width: 300,
                  child: Card(
                    child: InkWell(
                      onTap: () {},
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                          'assets/avacado-juise.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    elevation: 15,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
