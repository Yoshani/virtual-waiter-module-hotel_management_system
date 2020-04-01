import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';



const textInputDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0)),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink, width: 1.0)),
);

//  const a  =Transform.scale(
//             scale: 0.5,
//             child: LiteRollingSwitch(
//               //initial value
//               value: widget.item.available,
//               textOn: '   ADD',
//               textOff: 'Remove',
//               colorOn: Colors.greenAccent[700],
//               colorOff: Colors.redAccent[700],
//               iconOn: Icons.done,
//               iconOff: Icons.remove_circle_outline,
//               textSize: 18.0,
//               onChanged: (bool state) {
//                 //Use it to manage the different states
//                 // setState(() => available = state);
//               },
//             ),
//           );