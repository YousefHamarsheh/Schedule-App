// ignore_for_file: file_names

import 'package:flutter/material.dart';

class scTable extends StatefulWidget {
  const scTable({Key? key}) : super(key: key);

  @override
  _ScTable createState() => _ScTable();
}

class _ScTable extends State<scTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("Schedule Page"),
    );
  }
}
