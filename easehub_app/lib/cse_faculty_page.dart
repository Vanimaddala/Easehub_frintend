import 'package:flutter/material.dart';

class CseFacultyPage extends StatelessWidget {
  final String name;
  final String designation;

  const CseFacultyPage(
      {Key? key, required this.name, required this.designation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSE Faculty Page'),
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
