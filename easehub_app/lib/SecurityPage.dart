import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of recent permissions
    List<String> recentPermissions = [
      "Permission 1",
      "Permission 2",
      "Permission 3",
      "Permission 4",
      "Permission 5",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Security Page'),
        backgroundColor: Colors.blue[900], // Dark blue app bar color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3, // Add elevation for a subtle shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort list by:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    DropdownButton<String>(
                      items:
                          <String>['Date', 'Name', 'Type'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle sorting
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recentPermissions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3, // Add elevation for a subtle shadow effect
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: ListTile(
                    title: Text(
                      recentPermissions[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    leading: Icon(
                      Icons.security,
                      color: Colors.blue[900], // Dark blue icon color
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[600], // Gray arrow icon color
                    ),
                    onTap: () {
                      // Handle tap on permission item
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Permission Details'),
                          content: Text('Details of permission ${index + 1}'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
