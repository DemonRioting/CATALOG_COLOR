import 'package:catagoly_colorss/TextToSpeech.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'classText.dart';

// >>>>>>>>>>>>>>>>>>>>>>>       class data color magnate
class Data {
  // >>>>>>>        every open app take sound help
  static int statusfirstpage = 1;
  static int statussecoundpage = 1;
  static int statusselectcolor = 1;

  static void soundHelpFirstPage() {
    if (statusfirstpage == 1) {
      statusfirstpage = 0;
      Tts().speakEng(allText.firsthelp, 0.6);
    } else {}
  }

  static void soundHelpSecoundPage() {
    if (statussecoundpage == 1) {
      statussecoundpage = 0;
      Tts().speakEng(allText.secoundhelp, 0.6);
    } else {}
  }

  static void soundHelpSelectPage() {
    if (statusselectcolor == 1) {
      statusselectcolor = 0;
      Tts().speakEng(allText.selecthelp, 0.6);
    }else{}
  }

  // >>>>>>>>>>>  end

  //main page
  static String testcolor = '';
  static int statecapture = 0;
  // allpage
  static List<String> data = [
    /*
    '0xff42a5f5',
    '0xff0000ff',
    '0xff42a5f5',
    '0xff42a5f5',
    '0xff000000',
    '0xffffffff',
    '0xff606060',
    '0xff234212',
    '0xffff0000'*/
  ];
  static int count = 0;

  //secound oage
  static int number = 0;
  static Color selectColor;

  static void addColor(String newColor) {
    data.add(newColor);
    setListData();
  }

  static void setListData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('Storedata', data);
    
  }

  static void removeColor() {
    
      data.removeAt(number - 1);
      setListData();
      number = 0;

  }

  static void LoadData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    data = pref.getStringList('Storedata');
  }

  static Color getColor(int index) {
    return Color(int.parse(data[index]));
  }

  static Color getColorAnother(String test) {
    return Color(int.parse(test));
  }

  Color GetColorAnother(String test) {
    return getColorAnother(test);
  }

  Color GetsColor(int index) {
    return getColor(index);
  }

  static int abs(int x, int y) {
    if (x > y)
      return x - y;
    else
      return y - x;
  }
  int Abs(int x,int y){
    return abs(x,y);
  }

  static int countList() {
    if (data == null)
      return 0;
    else
      return data.length;
  }

  int CountList() {
    return countList();
  }

  static void incrementcount() {
    count++;
  }

  static bool findColorinUnipue(String find, List<String> test) {
    bool add = true;
    for (int i = 0; i < test.length; i++) {
      if (getstringtoColor(test[i]) == getstringtoColor(find)) add = false;
    }
    return add;
  }

  static List<String> uniqueColors() {
    List<String> test = [];
    for (int i = 0; i < countList(); i++) {
      if (findColorinUnipue(data[i], test)) {
        test.add(data[i]);
      }
    }
    return test;
  }

  List<String> UniqeColors() {
    return uniqueColors();
  }

  List<int> PositionColor(String test) {
    return positionColor(test);
  }

  static List<int> positionColor(String test) {
    List<int> Tt = [];
    for (int i = 0; i < countList(); i++) {
      if (getstringtoColor(data[i]) == getstringtoColor(test)) {
        Tt.add(i + 1);
      }
    }
    return Tt;
  }

  static double getHueValue(Color test) {
    double RmG = (test.red - test.green) / 255;
    double RmB = (test.red - test.blue) / 255;
    double GmB = (test.green - test.blue) / 255;
    double onTop = (RmG + RmB) / 2;
    double onUnter = sqrt(pow(RmG, 2) + GmB * RmB);
    double tes = acos(onTop / onUnter);
    //print('red = ${test.red/255} green = ${test.green/255} blue = ${test.blue/255}');
    //print('r - g = ${RmG}  and r - b = ${RmB}');
    //print('ontop  = ${onTop}  onUnder = ${onUnter}  and anser before = ${onTop/onUnter}');
    //print(tes);
    if (test.blue > test.green)
      return 360 - tes * 180 / pi;
    else
      return tes * 180 / pi;
  }

  static double getIntensityValue(Color test) {
    return ((test.red + test.blue + test.green) / 255 / 3);
  }

  static double getSaturationValue(Color test) {
    int min = test.red;
    if (test.green < min) min = test.green;
    if (test.blue < min) min = test.blue;
    double testt = 1 - (3 * min / (test.blue + test.green + test.red));
    return testt;
  }

  double GetHueValue(Color test) {
    return getHueValue(test);
  }

  double GetIntensityValue(Color test) {
    return getIntensityValue(test);
  }

  double GetSaturationValue(Color test) {
    return getSaturationValue(test);
  }

  static String getstringtoColor(String colors) {
    double huavalue = getHueValue(getColorAnother(colors));
    if (huavalue <= 20 || huavalue >= 337)
      return 'red';
    else if (huavalue < 37)
      return 'orange';
    else if (huavalue < 62)
      return 'yello';
    else if (huavalue < 142)
      return 'green';
    else if (huavalue < 172)
      return 'cyan';
    else if (huavalue < 192)
      return 'light blue';
    else if (huavalue < 261)
      return 'blue';
    else if (huavalue < 274)
      return 'purple';
    else if (huavalue < 306)
      return 'violet';
    else if (huavalue < 337)
      return 'pink';
    else
      return 'white';
  }

  String GetStringColor(String value) {
    return getstringtoColor(value);
  }
} //  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>     class text to speech

