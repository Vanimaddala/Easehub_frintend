import 'package:flutter/material.dart';

class EceFacultyPage extends StatelessWidget {
  final String name;
  final String designation;

  const EceFacultyPage(
      {Key? key, required this.name, required this.designation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECE Faculty Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, $name',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Designation: $designation',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
