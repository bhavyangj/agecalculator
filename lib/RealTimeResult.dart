import 'dart:async';

import 'package:agecalculator/main.dart';
import 'package:flutter/material.dart';

class MyRealResult extends StatefulWidget {
  final startDate, theme;
  MyRealResult({Key key, this.startDate, this.theme}) : super(key: key);

  @override
  _MyRealResultState createState() => _MyRealResultState();
}

class _MyRealResultState extends State<MyRealResult> {
  DateTime now = DateTime.now();
  Timer _everySecond;
  var diffDate, diffDateM, diffDateMD, diffDateW, diffDateWD, diffDateY, diffDateYM, diffDateYMD;
  void start(){
    now = DateTime.now();
    now = DateTime.now();
    diffDate = now.difference(widget.startDate);
    diffDateM = (diffDate.inDays*0.032855).floor();
    diffDateMD = (((diffDate.inDays*0.032855) - diffDateM)*30).floor();
    diffDateW = (diffDate.inDays/7).floor();
    diffDateWD = (((diffDate.inDays/7)-diffDateW)*7).floor();
    diffDateY = (diffDate.inDays/365).floor();
    diffDateYM =  (((diffDate.inDays/365) - diffDateY)*12).floor();
    diffDateYMD =  (((((diffDate.inDays/365) - diffDateY)*12) - diffDateYM)*30).floor();
  }
  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if(!mounted)
        return;
      setState(() {
        now = DateTime.now();
        diffDate = now.difference(widget.startDate);
        diffDateM = (diffDate.inDays*0.032855).floor();
        diffDateMD = (((diffDate.inDays*0.032855) - diffDateM)*30).floor();
        diffDateW = (diffDate.inDays/7).floor();
        diffDateWD = (((diffDate.inDays/7)-diffDateW)*7).floor();
        diffDateY = (diffDate.inDays/365).floor();
        diffDateYM =  (((diffDate.inDays/365) - diffDateY)*12).floor();
        diffDateYMD =  (((((diffDate.inDays/365) - diffDateY)*12) - diffDateYM)*30).floor();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    start();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Real Time Updating'),
          backgroundColor: widget.theme,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5,),
                  Text(
                    'Time From ${widget.startDate}',
                    style: TextStyle(fontSize: 25, color: themecolor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '$diffDateY Years $diffDateYM Months $diffDateYMD days',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '$diffDateM Months $diffDateMD Days',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '$diffDateW Weeks $diffDateWD Days',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '${diffDate.inDays} Days',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '${diffDate.inHours} Hours',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '${diffDate.inMinutes} Minutes',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '${diffDate.inSeconds} Seconds',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: widget.theme),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: widget.theme,
                    padding: const EdgeInsets.fromLTRB(25,12,25,12),
                    textColor: Colors.white,
                    child: const Text('Go Back', style: TextStyle(fontSize: 20)),
                  ),
                ]
            ),
          ),
        )
    );
  }
}