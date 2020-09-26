import 'package:agecalculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
class Settings extends StatefulWidget {
  final theme;
  Settings({Key key, this.theme}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
//  ColorSwatch _tempMainColor;
  Color currentcolor = themecolor;
  Color changeColor(Color color){
    setState(() => currentcolor = color);
    return currentcolor;
  }

  Color openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentcolor,
              onColorChanged: changeColor,
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              showLabel: true,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(2.0),
                topRight: const Radius.circular(2.0),
              ),
            ),
          ),
        );
      },
    );
    return currentcolor;
  }
  Future<bool> _onBackPressed() {
    Navigator.pop(context, currentcolor);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: currentcolor,
          ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            "change Theme color",
            style: Theme.of(context).textTheme.headline,
          ),
          const SizedBox(height: 62.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: currentcolor,
                radius: 35.0,
              ),
            ],
          ),
            const SizedBox(height: 16.0),
            OutlineButton(
              onPressed: (){
                openColorPicker();
  //              return themecolor;
              },
              child: const Text('choose color'),
              color: currentcolor,
            ),
          ],
        ),
      ),
    );
  }
}