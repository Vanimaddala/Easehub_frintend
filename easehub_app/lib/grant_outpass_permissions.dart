import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GrantOutpassPermissions extends StatefulWidget {
  final String? hodDepartment;
  final String token;

  const GrantOutpassPermissions({
    Key? key,
    required this.hodDepartment,
    required this.token,
  }) : super(key: key);

  @override
  _GrantOutpassPermissionsState createState() =>
      _GrantOutpassPermissionsState();
}

class _GrantOutpassPermissionsState extends State<GrantOutpassPermissions> {
  TextEditingController rollNumberController = TextEditingController();
  bool isFetchingDetails = false;
  Map<String, dynamic> details = {};

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
            TextField(
              controller: rollNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Roll Number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isFetchingDetails ? null : fetchDetails,
              child: isFetchingDetails
                  ? CircularProgressIndicator()
                  : Text('Fetch Details'),
            ),
            SizedBox(height: 20),
            if (details.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(details.toString()), // Display details
                ],
              ),
          ],
        ),
      ),
    );
  }

  void fetchDetails() {
    final rollNumber = rollNumberController.text.trim();
    final token = widget.token;

    if (rollNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a roll number.'),
        ),
      );
      return;
    }

    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Token is missing.'),
        ),
      );
      return;
    }

    print(' The generated Token: $token');
    print('Roll Number: $rollNumber');

    setState(() {
      isFetchingDetails = true;
    });

    final url =
        'https://easehub-production.up.railway.app/api/students/$rollNumber/outpass';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    http
        .post(
      Uri.parse(url),
      headers: headers,
    )
        .then((response) {
      setState(() {
        isFetchingDetails = false;
      });
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fetched details.'),
          ),
        );
        final jsonResponse = json.decode(response.body);
        setState(() {
          details = jsonResponse; // Store details in the map
        });
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Invalid roll number. Please enter a valid roll number.'),
          ),
        );
        setState(() {
          details.clear(); // Clear details if roll number is invalid
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to fetch details. Please try again later.'),
          ),
        );
      }
    }).catchError((error) {
      setState(() {
        isFetchingDetails = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    });
  }
}
