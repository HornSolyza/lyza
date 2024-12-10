import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseTitle;

  CourseDetailScreen({required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Thumbnail
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.purple,
                  size: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Course Title and Details
            Text(
              "Flutter Complete Course",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Created by Dear Programmer",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 5),
            Text(
              "55 Videos",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            // Tabs (Videos and Description)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Videos"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Description",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Videos List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildVideoTile(
                  context,
                  title: [
                    "Introduction to Flutter",
                    "Installing Flutter on Windows",
                    "Setup Emulator on Windows",
                    "Creating Our First App"
                  ][index],
                  duration: "20 min 50 sec",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoTile(BuildContext context, {required String title, required String duration}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purple[100],
        child: Icon(Icons.play_arrow, color: Colors.purple),
      ),
      title: Text(title, style: TextStyle(fontSize: 16)),
      subtitle: Text(duration, style: TextStyle(color: Colors.grey)),
      onTap: () {
        // Action when tapped
      },
    );
  }
}
