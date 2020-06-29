import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_management_system/models/vWaiter/offer.dart';
import 'package:hotel_management_system/screens/virtual_waiter/no_offers.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/shared/loading.dart';
import 'bottom_nav_bar.dart';
import 'offer_tile.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {

  @override
  Widget build(BuildContext context) {

    void setPageState(){
      setState(() {
      });
    }
    return StreamBuilder<List<Offer>>(
      stream: VWaiterDatabase2().offers,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Loading();
        }
        List<Offer> offerList=snapshot.data;

        return Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          appBar: AppBar(   
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ),
                onPressed: () {
                  SystemChrome.setEnabledSystemUIOverlays ([]);
                  Navigator.pop(context);
                }
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1.5,
          ),
          body:
          offerList.isEmpty?
          NoOffers()
          :Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 50.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                    )
                  ),
                  child: Text(
                    "         Exclusive Special Offers        ",
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    ),
                  )
                ),
              ),
 
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                  itemCount: offerList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OfferTile(
                      index: index,
                      offer: offerList[index],
                      offerPageState: setPageState,
                    );
                  },
                ),
              ),
            ],
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
      }
    );
  }
}