import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/shared_preferences.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/shared/constants.dart';


class Settings extends StatefulWidget {

  static RestaurantTable table;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  SharedPref sharedPref = SharedPref();
  final _formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {  
    return StreamBuilder<List<RestaurantTable>>(
      stream: VWaiterDatabase2().tables,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Image.asset('assets/setloader.gif');
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
                key: Key('vwaiter-dropdown'),
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
                key: Key('save-settings'),
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

