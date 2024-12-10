import 'package:flutter/material.dart';
import 'course_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, Programmer"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildIconTile(Icons.category, "Category"),
                  _buildIconTile(Icons.class_, "Classes"),
                  _buildIconTile(Icons.book, "BookStore"),
                  _buildIconTile(Icons.live_tv, "Live Course"),
                  _buildIconTile(Icons.leaderboard, "LeaderBoard"),
                  _buildIconTile(Icons.free_breakfast, "Free Course"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Courses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildCourseCard(context, "Flutter", "55 Videos"),
                  _buildCourseCard(context, "React Native", "55 Videos"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.purple), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library, color: Colors.purple), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.purple), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.purple), label: "Account"),
        ],
      ),
    );
  }

  Widget _buildIconTile(IconData icon, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.purpleAccent,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildCourseCard(BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetailScreen(courseTitle: title)),
        );
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple,
            child: Text(title[0], style: TextStyle(color: Colors.white)),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
