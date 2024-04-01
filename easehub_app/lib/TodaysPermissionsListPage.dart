import 'package:flutter/material.dart';

class TodaysPermissionsListPage extends StatefulWidget {
  final String branch;
  final String year;
  final String eventName;
  final String permissionEndDate;
  final List<String> selectedStudents;

  TodaysPermissionsListPage({
    required this.branch,
    required this.year,
    required this.eventName,
    required this.permissionEndDate,
    required this.selectedStudents,
  });

  @override
  _TodaysPermissionsListPageState createState() =>
      _TodaysPermissionsListPageState();
}

class _TodaysPermissionsListPageState extends State<TodaysPermissionsListPage> {
  Map<String, List<String>> permissionsByYear = {}; // Store permissions here

  @override
  void initState() {
    super.initState();
    segregatePermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Permissions List"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: permissionsByYear.length,
          itemBuilder: (context, index) {
            String year = permissionsByYear.keys.elementAt(index);
            List<String> permissions = permissionsByYear[year]!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Year: $year',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: permissions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(permissions[index]),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void segregatePermissions() {
    widget.selectedStudents.forEach((student) {
      String year = student.substring(
          0, 1); // Assuming the year is the first character of the student ID
      String permission =
          '${widget.year} ${widget.branch} - ${widget.eventName} ($student)';
      if (!permissionsByYear.containsKey(year)) {
        permissionsByYear[year] = [];
      }
      permissionsByYear[year]!.add(permission);
    });
    setState(() {}); // Trigger UI update
  }
}
