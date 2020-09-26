import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  final diffDate, diffDateM, diffDateMD, diffDateY, diffDateW, diffDateWD, diffDateYM, diffDateYMD, theme;
  MyResult({Key key, this.diffDate, this.diffDateM, this.diffDateW, this.diffDateY, this.diffDateYM, this.diffDateYMD, this.diffDateMD, this.diffDateWD, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: theme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$diffDateY Years $diffDateYM Months $diffDateYMD days',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),
                Text(
                  '$diffDateM Months $diffDateMD Days',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),
                Text(
                  '$diffDateW Weeks $diffDateWD Days',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),
                Text(
                  '${diffDate.inDays} Days',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),
                Text(
                  '${diffDate.inHours} Hours',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),
                Text(
                  '${diffDate.inMinutes} Minutes',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),
                Text(
                  '${diffDate.inSeconds} Seconds',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30,),

                RaisedButton(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: theme),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: theme,
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