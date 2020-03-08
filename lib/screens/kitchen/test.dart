
import 'package:flutter/material.dart';


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('test'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/coffee_bg.png')),
        ),
        child: ListView(children: [
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: ClipRRect(
                    borderRadius: (BorderRadius.circular(20.0)),
                    child: Opacity(
                      opacity: 0.8,
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
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: ClipRRect(
                    borderRadius: (BorderRadius.circular(20.0)),
                    child: Opacity(
                      opacity: 0.8,
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
              ),
            ),
          ),
          SizedBox(height:20.0),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: ClipRRect(
                    borderRadius: (BorderRadius.circular(20.0)),
                    child: Opacity(
                      opacity: 0.8,
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
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: ClipRRect(
                    borderRadius: (BorderRadius.circular(20.0)),
                    child: Opacity(
                      opacity: 0.8,
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
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: ClipRRect(
                    borderRadius: (BorderRadius.circular(20.0)),
                    child: Opacity(
                      opacity: 0.8,
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
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
