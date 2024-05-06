import 'package:flutter/material.dart';
import 'Mage_Data.dart';
import 'SelectClor.dart';
import 'TextToSpeech.dart';

//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/foundation/key.dart';

class SecoundPage extends StatefulWidget {
  const SecoundPage({Key key}) : super(key: key);

  @override
  State<SecoundPage> createState() => _SecoundPageState();
}

class _SecoundPageState extends State<SecoundPage> {
  @override
  void initState() {
    super.initState();
    Data.soundHelpSecoundPage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          // User swiped Left

          if (Data.number > 0) {
            Tts().speakEng(
                'please long press for confirm or tab for cancel ', 0.6);
            myDialog2();
          } else {
            Tts().speakEng('please select Color', 0.7);
          }
        } else if (details.primaryVelocity < 0) {
          // User swiped Right
          setState(() {
            ///Data.count = Data.count;
            Tts().speakEng('unique color page', 0.7);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const SelectPageColor())));
          });
        }
      },
      child: bodySecoundPage(),
    );
  }

  Future<void> myDialog2() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => GestureDetector(
          onLongPress: () {
            setState(() {
              Data.removeColor();
            });
            Tts().speakEng('remove success', 0.7);
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
}

class bodySecoundPage extends StatefulWidget {
  const bodySecoundPage({Key key}) : super(key: key);

  @override
  State<bodySecoundPage> createState() => _bodySecoundPageState();
}

class _bodySecoundPageState extends State<bodySecoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SECOUND PAGE'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 150),
          child: Column(
            children: [
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('select = ${Data.number}'),
                    Data.selectColor != null
                        ? Text('Color = ${Data.selectColor}')
                        : Text('no color'),
                    Container(
                      height: 10,
                      width: 10,
                      color: Data.selectColor != null
                          ? Data.selectColor
                          : Colors.amber,
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: createlsit(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button_Navagation_goback(),
    );
  }

  List<Widget> createlsit() {
    List<Widget> x = [];
    for (int i = 0; i < Data().CountList(); i++) {
      x.add(GestureDetector(
          onTap: () {
            setState(() {
              Data.number = i + 1;
              Data.selectColor = Data.getColor(i);
              Tts().speakEng(
                  ' The number is ${i + 1}  The color is ${Data().GetStringColor(Data.data[i])}',
                  0.7);
            });
          },
          child: Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(color: Data().GetsColor(i)),
            padding: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${i + 1}   >'),
                  Text("${Data().GetStringColor(Data.data[i])}"),
                  Text('${Data().GetsColor(i)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('red = ${Data().GetsColor(i).red}'),
                  Text('green = ${Data().GetsColor(i).green}'),
                  Text('blue = ${Data().GetsColor(i).blue}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Hue = ${Data().GetHueValue(Data().GetsColor(i)).toStringAsFixed(2)}'),
                  Text(
                      'Saturation  = ${Data().GetSaturationValue(Data().GetsColor(i)).toStringAsFixed(2)}'),
                  Text(
                      'Intensity = ${Data().GetIntensityValue(Data().GetsColor(i)).toStringAsFixed(2)}'),
                ],
              )
            ]),
          )));
    }
    return x;
  }
}

class Button_Navagation_goback extends StatelessWidget {
  const Button_Navagation_goback({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 380,
      child: FloatingActionButton(
        child: Text('GoBack'), //child widget inside this button
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        onPressed: () {
          Tts().speakEng('First Page', 0.7);
          Navigator.pop(context);
        },
      ),
    );
  }
}
