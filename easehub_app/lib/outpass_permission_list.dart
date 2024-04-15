import 'package:flutter/material.dart';

class OutpassPermissionListPage extends StatelessWidget {
  // Sample list of granted outpass permissions
  final List<String> grantedPermissions = [
    'John Doe - 123456',
    'Jane Smith - 789012',
    'Alice Johnson - 345678',
    'Bob Williams - 901234',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outpass Permission List'),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: grantedPermissions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(grantedPermissions[index]),
            // You can customize ListTile further as per your requirement
          );
        },
      ),
    );
  }
}
