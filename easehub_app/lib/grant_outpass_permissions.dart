import 'package:flutter/material.dart';

class GrantOutpassPermissions extends StatefulWidget {
  @override
  _GrantOutpassPermissionsState createState() =>
      _GrantOutpassPermissionsState();
}

class _GrantOutpassPermissionsState extends State<GrantOutpassPermissions> {
  String? selectedYear;
  String? selectedRollNumber;

  List<String> iiiYearStudents =
      List.generate(20, (index) => '2225A05V${index + 1}');
  List<String> iiYearStudents =
      List.generate(20, (index) => '2326A05V${index + 1}');

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grant Outpass Permissions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Year:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedYear,
              onChanged: (value) {
                setState(() {
                  selectedYear = value;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text('III Year'),
                  value: 'III Year',
                ),
                DropdownMenuItem(
                  child: Text('II Year'),
                  value: 'II Year',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Roll Number:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            if (selectedYear == 'III Year')
              DropdownButton<String>(
                value: selectedRollNumber,
                onChanged: (value) {
                  setState(() {
                    selectedRollNumber = value;
                  });
                },
                items: iiiYearStudents
                    .map((rollNumber) => DropdownMenuItem(
                          child: Text(rollNumber),
                          value: rollNumber,
                        ))
                    .toList(),
              ),
            if (selectedYear == 'II Year')
              DropdownButton<String>(
                value: selectedRollNumber,
                onChanged: (value) {
                  setState(() {
                    selectedRollNumber = value;
                  });
                },
                items: iiYearStudents
                    .map((rollNumber) => DropdownMenuItem(
                          child: Text(rollNumber),
                          value: rollNumber,
                        ))
                    .toList(),
              ),
            SizedBox(height: 20),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sending notification functionality
              },
              child: Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
