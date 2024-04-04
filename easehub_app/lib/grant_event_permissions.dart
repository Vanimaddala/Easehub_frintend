import 'package:flutter/material.dart';

class GrantEventPermissions extends StatefulWidget {
  @override
  _GrantEventPermissionsState createState() => _GrantEventPermissionsState();
}

class _GrantEventPermissionsState extends State<GrantEventPermissions> {
  List<String> students = List.generate(20, (index) => 'Student ${index + 1}');
  List<String> selectedStudents = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventEndDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grant Event Permissions'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Students:',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return CheckboxListTile(
                    title: Text(student),
                    value: selectedStudents.contains(student),
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          selectedStudents.add(student);
                        } else {
                          selectedStudents.remove(student);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: eventNameController,
              decoration: InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: eventEndDateController,
              decoration: InputDecoration(
                labelText: 'Event End Date',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement grant permission functionality
              },
              child: Text(
                'Grant Permission',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
