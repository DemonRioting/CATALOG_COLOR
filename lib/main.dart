import 'package:flutter/material.dart';
import 'SecoundPageData.dart';
import 'Mage_Data.dart';
import 'TextToSpeech.dart';
import 'package:color_picker_camera/color_picker_camera.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "USE dATA",
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Data.LoadData();
    Data.soundHelpFirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          if (Data.statecapture == 0) {
            Tts().speakEng('capture is not already ', 0.8);
          } else {
            Tts().speakEng(
                'please long press for confirm or tab for cancel ', 0.6);
            myDialog();
          }
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          setState(() {
            UseColorPicker();
          });
        }
      },
      onVerticalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          setState(() {
            Data.count = Data.count * 2;
          });
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          setState(() {
            Data.count = Data.count * 2;
          });
        }
      },
      child: bodyFirstPage(),
    );
  }

  Future<void> myDialog() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => GestureDetector(
          onLongPress: () {
            setState(() {
              Data.addColor(Data.testcolor);
              Data.statecapture = 0;
            });
            Tts().speakEng('set color success', 0.7);
            Navigator.pop(context);
          },
          onTap: () {
            Tts().speakEng('cancel ', 0.8);
            Navigator.pop(context);
          },
          child: Container(
            color: Color.fromARGB(255, 255, 191, 0).withOpacity(0.2),
            child: AlertDialog(
              title: Text('Confirm Add color'),
              actions: [
                Text('please hold press to   ADD COLOR'),
                Text('please tab to                CANCEL      ')
              ],
            ),
          )),
    );
  }

  Future<void> UseColorPicker() async {
    String testString = await ColorPickerCamera.captureColorFromCamera;
    setState(() {
      Data.testcolor = testString;
      Data.statecapture = 1;
    });
    Tts().speakEng('Color is ${Data().GetStringColor(Data.testcolor)}', 0.8);
  }
}

class bodyFirstPage extends StatefulWidget {
  const bodyFirstPage({Key key}) : super(key: key);

  @override
  State<bodyFirstPage> createState() => _bodyFirstPageState();
}

class _bodyFirstPageState extends State<bodyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIRST PAGE'),
      ),
      body: Center(
          child: Container(
        height: 200,
        width: 200,
        color: Data.testcolor != ''
            ? Data().GetColorAnother(Data.testcolor)
            : Colors.white,
        child: Column(
          children: [
            Text('test color = ${Data.testcolor}'),
            Text('status capture = ${Data.statecapture}'),
            Data.testcolor != ''
                ? Text('Color is ${Data().GetStringColor(Data.testcolor)}')
                : Text('no color'),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button_Navagation_to_Secoundpage(),
    );
  }
}

class Button_Navagation_to_Secoundpage extends StatelessWidget {
  const Button_Navagation_to_Secoundpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 380,
      child: FloatingActionButton(
        child: Text('GoTo secound Page'), //child widget inside this button
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        onPressed: () {
          Tts().speakEng('Secoound Page', 0.7);
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SecoundPage())));
        },
      ),
    );
  }
}
