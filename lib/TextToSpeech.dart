import 'Mage_Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Tts {
  final FlutterTts flutterTts = FlutterTts();
 
  speakEng(String text,double speed) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.5); // pitch low - hight  0.5 - 1.5
    await flutterTts.setSpeechRate(speed); // speed 0 - 1
    await flutterTts.speak(text);
  }

}
