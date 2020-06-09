import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
import 'bottom_nav_bar.dart';

class NameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter a name' : null;
  }
}

class FeedbackFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter your feedback' : null;
  }
}

class CustomerFeedback extends StatefulWidget {
  @override
  _CustomerFeedbackState createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _customerName;
  String _feedback;
  double rating = 0;

  @override
  Widget build(BuildContext context) {
 
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
      body: Column(
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
                  "          Give us your feedback!        ",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  ),
                )
              ),
            ),
          //form to get feedback
          Form(
            key: _formKey,
            autovalidate: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
                        child: Text(
                        "Enter your name",
                        style: TextStyle(
                        color: Colors.indigo[500],
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        ),
                    ),
                      ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    key: Key('name'),
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your first and last name',
                        labelText: 'Name',
                    ),
                    validator: NameFieldValidator.validate,
                    onChanged: (val) => setState(() => _customerName = val),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    "What do you think about Pearl Hotel Restaurant?",
                    style: TextStyle(
                    color: Colors.indigo[500],
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    ),
                  ),
                  Text(
                    "We'd love to hear from you!",
                    style: TextStyle(
                    color: Colors.indigo[500],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    key: Key('feedback'),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.feedback),
                        hintText: 'Enter your feedback',
                        labelText: 'Feedback',
                    ),
                    validator: FeedbackFieldValidator.validate,
                    onChanged: (val) => setState(() => _feedback = val),
                  ),
                  SizedBox(height: 50.0),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Rate us",
                              style: TextStyle(
                                color: Colors.indigo[500],
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 90.0),
                            SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                                rating = v;
                                setState(() {});
                              },
                              starCount: 5,
                              rating: rating,
                              size: 40.0,
                              color: Colors.amber,
                              borderColor: Colors.amber,
                              spacing:0.0
                            )

                          ],
                        ),
                      ),
                  ),
                  
                  SizedBox(height: 40.0),
                  //submit feedback button
                  RaisedButton(
                    key: Key('submitfeedbackbutton'),
                    color: Colors.cyan[400],
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    onPressed: () async {
                      SystemChrome.setEnabledSystemUIOverlays ([]);
                      if(_formKey.currentState.validate()){
                        VWaiterDatabase2().submitFeedback(_customerName, _feedback, rating);
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                        showDialog(
                          context: context,
                          builder: (context) {
                            Future.delayed(Duration(seconds: 5), () {
                              Navigator.of(context).pop(true);
                            });
                            return AlertDialog(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                              ),
                              title: Text(
                                "Thank you for your feedback",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                ),
                              ),
                            );
                        });                       
                      }
                    }
                  ),
                  SizedBox(height: 20,),
                  RaisedButton(
                    key: Key('skipfeedbackbutton'),
                    color: Colors.grey[100],
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        ),
                    ),
                    onPressed: (){
                      SystemChrome.setEnabledSystemUIOverlays ([]);
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    }
                  ),
                ],
              ),
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
}