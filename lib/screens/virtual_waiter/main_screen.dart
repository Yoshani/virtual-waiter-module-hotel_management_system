import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/vwaiter_home.dart';

class VwaiterMainScreen extends StatefulWidget {
  @override
  _VwaiterMainScreenState createState() => _VwaiterMainScreenState();
}

class _VwaiterMainScreenState extends State<VwaiterMainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            VwaiterHome(),
            Cart(),
            // About(),
            // OrderStatus(),
            // Feedback()
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width:7),
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 24.0,
                  color: Colors.white
                ),
                color: Colors.black,
                onPressed: ()=>_pageController.jumpToPage(0),
              ),

              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 24.0,
                  color: Colors.white
                ),
                color:Colors.lightBlue[400],
                onPressed: ()=>_pageController.jumpToPage(1),
              ),

              //extra icon added to achieve evenness
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                  color: Colors.white
                ),
                color:Colors.lightBlue[400],
                onPressed: ()=>_pageController.jumpToPage(2),
              ),

              IconButton(
                icon: Icon(
                  Icons.shopping_basket,
                  size: 24.0,
                  color: Colors.white
                ),
                color:Colors.lightBlue[400],
                onPressed: ()=>_pageController.jumpToPage(3),
              ),

              IconButton(
                icon: Icon(
                  Icons.feedback,
                  size: 24.0,
                  color: Colors.white
                ),
                color:Colors.lightBlue[400],
                onPressed: ()=>_pageController.jumpToPage(4),
              ),

              SizedBox(width:7),
            ],
          ),
          color: Colors.cyan[400],
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[400],
          elevation: 8.0,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset('assets/logo.png'),
          ),
          onPressed: ()=>_pageController.jumpToPage(2),
        ),

      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
