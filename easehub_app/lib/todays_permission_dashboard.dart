import 'package:flutter/material.dart';

class TodaysPermissionDashboard extends StatelessWidget {
  final String branch = 'CSE'; // Default branch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Permission Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Date: ${DateTime.now().toString().substring(0, 10)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Branch: $branch',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show 3rd year permission list
                _showThirdYearPermissions(context);
              },
              child: Text('View 3rd Year Permissions'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Show 2nd year permission list
                _showSecondYearPermissions(context);
              },
              child: Text('View 2nd Year Permissions'),
            ),
            SizedBox(height: 20),
            Text(
              '3rd Year Permissions:', // Placeholder text for 3rd year permissions
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Display the 3rd year permission list below
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Assuming 20 students
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Student ${index + 1}'),
                    // Implement dropdown menu and other widgets as needed
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              '2nd Year Permissions:', // Placeholder text for 2nd year permissions
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Display the 2nd year permission list below
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Assuming 20 students
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Student ${index + 1}'),
                    // Implement dropdown menu and other widgets as needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showThirdYearPermissions(BuildContext context) {
    // TODO: Implement navigation to 3rd year permissions page
  }

  void _showSecondYearPermissions(BuildContext context) {
    // TODO: Implement navigation to 2nd year permissions page
  }
}
