import 'package:flutter/material.dart';
import 'Mage_Data.dart';
import 'TextToSpeech.dart';

class SelectPageColor extends StatefulWidget {
  const SelectPageColor({Key key}) : super(key: key);

  @override
  State<SelectPageColor> createState() => _SelectPageColorState();
}

class _SelectPageColorState extends State<SelectPageColor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left
          setState(() {
            Tts().speakEng("Secound Page", 0.7);
            Navigator.pop(context);
          });
        }
      },
      child: bodySelectPageColor(),
    );
  }
}

class bodySelectPageColor extends StatefulWidget {
  const bodySelectPageColor({Key key}) : super(key: key);

  @override
  State<bodySelectPageColor> createState() => _bodySelectPageColorState();
}

class _bodySelectPageColorState extends State<bodySelectPageColor> {
  List<String> test = [];

  @override
  void initState() {
    super.initState();
    test = Data().UniqeColors();
    Data.soundHelpSelectPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECT COLOR'),
      ),
      body:SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: createlsit(),
            ),
          ),
        ),
      
    );
  }

  List<Widget> createlsit() {
    List<Widget> x = [];
    for (int i = 0; i < test.length; i++) {
      x.add(GestureDetector(
          onTap: () {
            setState(() {
              TalkPosition(test[i]);
            });
          },
          child: Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(color: Data().GetColorAnother(test[i])),
            padding: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${i + 1}   >'),
                  Text("${Data().GetStringColor(test[i])}"),
                  Text('${Data().GetColorAnother(test[i])}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('red = ${Data().GetColorAnother(test[i]).red}'),
                  Text('green = ${Data().GetColorAnother(test[i]).green}'),
                  Text('blue = ${Data().GetColorAnother(test[i]).blue}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Hue = ${Data().GetHueValue(Data().GetColorAnother(test[i])).toStringAsFixed(2)}'),
                  Text(
                      'Saturation  = ${Data().GetSaturationValue(Data().GetColorAnother(test[i])).toStringAsFixed(2)}'),
                  Text(
                      'Intensity = ${Data().GetIntensityValue(Data().GetColorAnother(test[i])).toStringAsFixed(2)}'),
                ],
              )
            ]),
          )));
    }
    return x;
  }

  void TalkPosition(String x) {
    List<int> testTalk = Data().PositionColor(x);
    Tts().speakEng(
        'color is ${Data().GetStringColor(x)} ' + getTalk(testTalk), 0.5);
  }

  String getTalk(List<int> testTalk) {
    String test = ' position is ';
    for (int i = 0; i < testTalk.length; i++) {
      test = test + ' ' + testTalk[i].toString();
    }
    print(test);
    return test;
  }
}
