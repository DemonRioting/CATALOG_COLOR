import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:catagoly_colorss/Mage_Data.dart';

void main() {
  test('testing addColor function', () {
    // setup
    Data.data = [];
    //do
    Data.addColor('red');
    //tset
    expect(Data.data, ['red']);
  });

  test('testing removeColor', () {
    //setup
    Data.data = ['red', 'blue'];
    Data.number = 1;
    //do
    Data.removeColor();
    //test
    expect(Data.data, ['blue']);
  });
  test('testing setListdata and LoadData', () {
    //setup
    Data.data = ['red', 'blue', 'green'];
    //do
    Data.setListData();
    Data.data = ['red', 'blue', 'green'];
    //do 2
    Data.LoadData();
    //testing
    expect(Data.data, ['red', 'blue', 'green']);
  });
  test('testing GetColorAnother function ', () {
    //setup
    String colorTest = '0xffffffff';
    String colorTest1 = '0xff000000';
    //do

    //test
    expect(Data().GetColorAnother(colorTest), Colors.white);
    expect(Data().GetColorAnother(colorTest1), Colors.black);
  });
  test('testing GetsColor', () {
    //set up
    Data.data = ['0xffffffff', '0xff000000'];
    // do
    //test
    expect(Data().GetsColor(0), Colors.white);
    expect(Data().GetsColor(1), Colors.black);
  });
  test('testing absolute function', () {
    //set up
    int x = 5, y = 6;
    int x1 = 6, y1 = 5;
    //do
    //test
    expect(Data().Abs(x, y), 1);
    expect(Data().Abs(x1, y1), 1);
  });
  test('testring countList function', () {
    //setup
    Data.data = ['red', 'blue', 'green'];
    //test
    expect(Data().CountList(), 3);
  });
  test('testing uniqueColors', () {
    //setup
    Data.data = [
      '0xffff0000',
      '0xffff0000',
      '0xff0000ff',
      '0xff00ff00',
      '0xff00ff00',
      '0xff00ff00'
    ];
    //do
    List<String> test = Data().UniqeColors();
    //test
    expect(test, ['0xffff0000', '0xff0000ff', '0xff00ff00']);
  });
  test('testing positionColor', () {
    //setup
    Data.data = [
      '0xffff0000',
      '0xffff0000',
      '0xff0000ff',
      '0xff00ff00',
      '0xff00ff00',
      '0xff00ff00'
    ];
    //do
    List<int> testInt = Data().PositionColor('0xff00ff00');
    //test
    expect(testInt, [4, 5, 6]);
  });
  test('testing hueValue function', () {
    expect(Data().GetHueValue(Colors.yellow).toStringAsFixed(2), '54.68');
    expect(Data().GetHueValue(Colors.purple).toStringAsFixed(2), '292.23');
  });
  test('testtinh IntensityValue finction', () {
    expect(Data().GetIntensityValue(Colors.yellow).toStringAsFixed(2), '0.72');
    expect(Data().GetIntensityValue(Colors.purple).toStringAsFixed(2), '0.48');
  });
  test('testing SaturationValue finction', () {
    expect(Data().GetSaturationValue(Colors.yellow).toStringAsFixed(2), '0.68');
    expect(Data().GetSaturationValue(Colors.purple).toStringAsFixed(2), '0.68');
  });
  test('testing getStringColor finction', () {
    expect(Data().GetStringColor('0xffff0000'), 'red');
    expect(Data().GetStringColor('0xff00ff00'), 'green');
    expect(Data().GetStringColor('0xff0000ff'), 'blue');
  });
}
