// ignore_for_file: file_names

import 'package:flutter/material.dart';

class msgPage extends StatefulWidget {
  const msgPage({Key? key}) : super(key: key);

  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<msgPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("Messages Page"),
    );
  }
}
