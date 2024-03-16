import 'package:flutter/material.dart';
import 'package:student_profile/Profile_Page/userprofile.dart';

import 'add_help.dart';
import 'add_post.dart';
import 'collaborate.dart';
import 'current_project.dart';
import 'history_project.dart';
import 'home.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myCurrentIndex = 0;
  List pages = const [
    Home(),
    AddPost(),
    Collaborate(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 152, 237),
        title: const Text(
          'Student Hub',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Handle chat icon tap
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: const Offset(8, 20),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.post_add),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Collaborate',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 150, // Set the height of the DrawerHeader
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/profiledummyimg.png'), // Replace with your image asset
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Uday Sutaria', // Replace with your name string
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/connections.png', // Replace with the path to your PNG image asset
              width: 24, // Adjust the width as needed
              height: 24, // Adjust the height as needed
            ),
            title: const Text('Connections'),
            onTap: () {
              // Handle navigation to item 1.
              Navigator.pop(context);
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              leading: Image.asset(
                'assets/images/contribution.png', // Replace with the path to your PNG image asset
                width: 24, // Adjust the width as needed
                height: 24, // Adjust the height as needed
              ),
              title: const Text('Contribution'),
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 55), // Adjust horizontal padding
                  title: const Text('Add'),
                  onTap: () {
                    // Handle navigation to Add subsection.
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddHelp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 55), // Adjust horizontal padding
                  title: const Text('Current'),
                  onTap: () {
                    // Handle navigation to Current subsection.
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrentProject(),
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 55), // Adjust horizontal padding
                  title: const Text('History'),
                  onTap: () {
                    // Handle navigation to History subsection.
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryProject(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/about_us.png', // Replace with the path to your PNG image asset
              width: 24, // Adjust the width as needed
              height: 24, // Adjust the height as needed
            ),
            title: const Text('About Us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/log_out.png', // Replace with the path to your PNG image asset
              width: 24, // Adjust the width as needed
              height: 24, // Adjust the height as needed
            ),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
