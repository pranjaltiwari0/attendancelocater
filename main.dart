import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool showListView = false;

  final List<Map<String, dynamic>> members = [
    {
      "id": 1,
      "name": "John Doe",
      "avatar": "https://randomuser.me/api/portraits/men/1.jpg",
      "location": "San Francisco Office",
      "online": true,
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "avatar": "https://randomuser.me/api/portraits/women/2.jpg",
      "location": "Remote",
      "online": false,
    },
    {
      "id": 3,
      "name": "Mike Johnson",
      "avatar": "https://randomuser.me/api/portraits/men/3.jpg",
      "location": "New York Office",
      "online": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          children: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "ATTENDANCE",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.group, color: Colors.purple),
                      SizedBox(width: 8),
                      Text(
                        "All Members",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: showListView
                ? ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(member["avatar"]),
                                    radius: 24,
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        member["name"],
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(Icons.location_pin, size: 16),
                                          SizedBox(width: 4),
                                          Text(
                                            member["location"],
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  badgeColor: member["online"]
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                badgeContent: Text(
                                  member["online"] ? "Online" : "Offline",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map, size: 48, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("Map view would be displayed here"),
                        Text(
                          "Using actual maps requires additional setup",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                showListView = !showListView;
              });
            },
            child: Text(
              showListView ? "Show Map View" : "Show List View",
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
