import 'package:agecalculator/result.dart';
import 'package:agecalculator/settings.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'RealTimeResult.dart';

void main() => runApp(RootPage());
Color themecolor = Colors.blue;
var bright = Colors.blue;
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: bright,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme){
        return MaterialApp(
          theme: theme,
          home: MainPage(title: 'Age Calculator'),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  bool isSwitched = false;

  var nthemecolor;
  Future<void> _startDateTime(BuildContext context) async {
    final DateTime SDpicked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(1970),
        lastDate: DateTime(2101)
    );
    final TimeOfDay STpicked = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (STpicked != null && STpicked != startTime)
      setState(() {
        startTime = STpicked;
      });
    if (SDpicked != null && SDpicked != startDate)
      setState(() {
        startDate = SDpicked;
      });
  }
  Future<void> _endDateTime(BuildContext context) async {
    final DateTime EDpicked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2101),
    );
    final TimeOfDay ETpicked = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (ETpicked != null && ETpicked != endTime)
      setState(() {
        endTime = ETpicked;
      });
    if (EDpicked != null && EDpicked != endDate)
      setState(() {
        endDate = EDpicked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: themecolor,
        actions: <Widget>[
          Switch(
            value: isSwitched,
            activeColor: Colors.white,
            onChanged: (value) {
              isSwitched = value;
              changeBrightness();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: themecolor,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:  AssetImage('assets/time.png')),
              ),
              child: null,
            ),
            ListTile(
              title: Text('Age Calculator',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              title: Text('Share App'),
              leading: Icon(Icons.share),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('More Apps'),
              leading: Icon(Icons.queue_play_next),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Feedback'),
              leading: Icon(Icons.message),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About app'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () async {
                  final tthemecolor = await Navigator.push(
                    context, ScaleRoute(page: Settings(theme: themecolor,)),
                );
                Navigator.pop(context);
                setState(() {
                  themecolor =  tthemecolor;
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Start Date',
              style: TextStyle(
                  fontSize: 20,
              color: themecolor,
              fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              padding: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () => {
                _startDateTime(context),
                print(startDate),
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.date_range,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              Text(
                                "   ${startDate.day}-${startDate.month}-${startDate.year}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Change",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: themecolor,
            ),
            SizedBox(height: 20.0,),
            // start time picker
            RaisedButton(
              padding: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () => {
                _startDateTime(context),
                print(startTime),
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              Text(
                                '  ${startTime.hour} : ${startTime.minute}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Change",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: themecolor,
            ),
            SizedBox(height: 40.0,),
            Text(
              'End Date',
              style: TextStyle(fontSize: 20,
                  color: themecolor,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              padding: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () => {
                _endDateTime(context),
                print(endDate),
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.date_range,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              Text(
                                "   ${endDate.day}-${endDate.month}-${endDate.year}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Change",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: themecolor,
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () => {
                _endDateTime(context),
                print(endTime),
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              Text(
                                '  ${endTime.hour} : ${endTime.minute}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Change",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: themecolor,
            ),
            SizedBox(height: 30,),
            RaisedButton(
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: themecolor),
              ),
              color: themecolor,
              padding: const EdgeInsets.fromLTRB(25,12,25,12),
              child: const Text('Calculate',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  )),
              onPressed: () async {
                startDate = startDate.subtract(Duration(hours: startDate.hour, minutes: startDate.minute,));
                endDate = endDate.subtract(Duration(hours: endDate.hour, minutes: endDate.minute,));
                startDate = startDate.add(Duration(hours: startTime.hour, minutes: startTime.minute,));
                endDate = endDate.add(Duration(hours: endTime.hour, minutes: endTime.minute,));
                var diffDate = endDate.difference(startDate);
                var diffDateM = (diffDate.inDays*0.032855).floor();
                var diffDateMD = (((diffDate.inDays*0.032855) - diffDateM)*30).floor();
                var diffDateW = (diffDate.inDays/7).floor();
                var diffDateWD = (((diffDate.inDays/7)-diffDateW)*7).floor();
                var diffDateY = (diffDate.inDays/365).floor();
                var diffDateYM =  (((diffDate.inDays/365) - diffDateY)*12).floor();
                var diffDateYMD =  (((((diffDate.inDays/365) - diffDateY)*12) - diffDateYM)*30).floor();
//                print('start: ${startDate.day}-${startDate.month}-${startDate.year}  Time: ${startDate.hour}:${startDate.minute}:${startDate.second}');
//                print('end: ${endDate.day}-${endDate.month}-${endDate.year}  Time: ${endDate.hour}:${endDate.minute}:${endDate.second}');
                await Navigator.push(
                  context,
                  ScaleRoute(page: MyResult(
                        diffDate: diffDate,
                        diffDateM: diffDateM,
                        diffDateMD: diffDateMD,
                        diffDateW: diffDateW,
                        diffDateWD: diffDateWD,
                        diffDateY: diffDateY,
                        diffDateYM: diffDateYM,
                        diffDateYMD: diffDateYMD,
                        theme: themecolor,
                      )
                  ),
                );
              },
            ),
            SizedBox(height: 30,),
            RaisedButton(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: themecolor),
              ),
              color: themecolor,
              padding: const EdgeInsets.fromLTRB(25,12,25,12),
              child: const Text('Calculate With Update',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  )),
              onPressed: () async {
                startDate = startDate.subtract(Duration(hours: startDate.hour, minutes: startDate.minute,));
                startDate = startDate.add(Duration(hours: startTime.hour, minutes: startTime.minute,));
                var diffDate = DateTime.now().difference(startDate);
                var diffDateM = (diffDate.inDays*0.032855).floor();
                var diffDateMD = (((diffDate.inDays*0.032855) - diffDateM)*30).floor();
                var diffDateW = (diffDate.inDays/7).floor();
                var diffDateWD = (((diffDate.inDays/7)-diffDateW)*7).floor();
                var diffDateY = (diffDate.inDays/365).floor();
                var diffDateYM =  (((diffDate.inDays/365) - diffDateY)*12).floor();
                var diffDateYMD =  (((((diffDate.inDays/365) - diffDateY)*12) - diffDateYM)*30).floor();
                Navigator.push(
                  context,
                  ScaleRoute(page: MyRealResult(
                    startDate: startDate,
                    theme: themecolor,
                  )
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
}