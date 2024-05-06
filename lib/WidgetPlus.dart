/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'Mage_Data.dart';

class ContainerSecoundPage extends StatefulWidget {
  final Color colors;
  final int counters;
  const ContainerSecoundPage({Key key, this.colors, this.counters})
      : super(key: key);

  @override
  State<ContainerSecoundPage> createState() => _ContainerSecoundPageState();
}

class _ContainerSecoundPageState extends State<ContainerSecoundPage> {
  Color test = colors<FormState>;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            Data.count = counters + 1;
          });
        },
        child: new Container(
          width: 250.0,
          padding: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
          color: Colors.green,
          child: new Column(children: [
            new Text("${listdata[i]}"),
          ]),
        ));
  }
}
*/