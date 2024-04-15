import 'package:flutter/material.dart';
import 'grant_event_permissions.dart'; // Import GrantEventPermissions widget
import 'grant_outpass_permissions.dart'; // Import GrantOutpassPermissions widget
import 'todays_permission_dashboard.dart'; // Import TodaysPermissionDashboard widget
import 'analytics.dart'; // Import Analytics widget

class CseHodPage extends StatefulWidget {
  final String? name;
  final String? role;
  final String? branch;

  const CseHodPage({Key? key, this.name, this.role, this.branch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSE HOD'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Department of Computer Science and Engineering',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Innovation and Excellence',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Name: $name'),
              subtitle: Text('Role: $role\nBranch: $branch'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $name!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Role: $role',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Branch: $branch',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GrantEventPermissions()),
                    );
                  },
                  icon: Icon(Icons.event),
                  iconSize: 40,
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GrantOutpassPermissions()),
                    );
                  },
                  icon: Icon(Icons.card_membership),
                  iconSize: 40,
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TodaysPermissionDashboard()),
                    );
                  },
                  icon: Icon(Icons.dashboard),
                  iconSize: 40,
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Analytics()),
                    );
                  },
                  icon: Icon(Icons.analytics),
                  iconSize: 40,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
