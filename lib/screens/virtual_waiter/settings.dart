import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/shared_preferences.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/shades/constants.dart';
import 'package:hotel_management_system/shades/loading.dart';


class Settings extends StatefulWidget {

  static RestaurantTable table;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  SharedPref sharedPref = SharedPref();
  final _formKey = GlobalKey<FormState>();

  loadSharedPrefs() async {
    try {
      RestaurantTable table = RestaurantTable.fromJson(await sharedPref.read("table"));
      setState(() {
        Settings.table=table;
      });
    } catch (Excepetion) {
      Settings.table=RestaurantTable(tableNo: 0, seats: 0);
    }
  }

  @override
  initState() {
    loadSharedPrefs();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {  
    return StreamBuilder<List<RestaurantTable>>(
      stream: VWaiterDatabase2().tables,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Loading();
        }
        List<RestaurantTable> tables = snapshot.data;
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Virtual Waiter Settings',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 50.0),
              DropdownButtonFormField(
                hint: Text("Select a table"),
                decoration: textInputDecoration,  //from constants.dart
                items: tables.map((table) {
                  return DropdownMenuItem(
                    value: table,
                    child: Text('${table.tableNo}'),
                  );
                }).toList(),
                onChanged: (RestaurantTable val) => setState(() => Settings.table=val ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selected table: ${Settings.table.tableNo}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              RaisedButton(
                color: Colors.cyan[400],
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  sharedPref.save("table", Settings.table);
                  Navigator.pop(context);
                }
              ),
            ],
          ),
        );
      }
    );
  }
}

