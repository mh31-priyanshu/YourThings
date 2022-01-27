import 'dart:async';

import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  DigitalClock({Key? key}) : super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() { 
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      if(_timeOfDay.minute != TimeOfDay.now().minute){
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_timeOfDay.hour}:${_timeOfDay.minute}",
          style: const TextStyle(
            fontSize: 50,
            letterSpacing: -1.5,
            wordSpacing: -1.5,
            color: Colors.white,
            fontFamily: 'RobotoThin'
            
          ),
        ),
        const SizedBox(width: 5,),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: const TextStyle(
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}