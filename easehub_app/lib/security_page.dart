import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  final String name;

  const SecurityPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Page'),
      ),
      body: Center(
        child: Text(
          'Hello, $name',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
