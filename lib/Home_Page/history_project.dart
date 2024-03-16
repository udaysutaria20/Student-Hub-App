import 'package:flutter/material.dart';

import 'contribution_history.dart';
import 'my_project_history.dart';


// ignore: must_be_immutable
class HistoryProject extends StatelessWidget {
  HistoryProject({super.key});

  List<Tab> tabs = [
    const Tab(child: Text('My Project')),
    const Tab(child: Text('Contributions')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Projects History',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: TabBar(
                tabs: tabs,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                indicatorColor: Colors.white,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width /
                        tabs.length /
                        6), // Adjust the padding to center the tabs
              )),
        ),
        body: TabBarView(
          children: [
            buildMyProjectHistoryTab(),
            buildContributionHistoryTab(),
            // buildOngoingProjectTab(),
          ],
        ),
      ),
    );
  }

Widget buildMyProjectHistoryTab() {
  // List to store project data
  List<Map<String, dynamic>> projectsData = [
    {
      'name': 'Student Hub: Mobile Application',
      'description': 'The mobile application will provide a user-friendly platform for students to easily connect, collaborate, and share ideas. Key functionalities will include secure user authentication via mobile number, a seamless post sharing and viewing system to facilitate idea exchange, a comprehensive profile update section for students to showcase their skills and experiences, a robust peer-to-peer connection and chat feature for seamless communication, and a collaborative project assistance system where students can seek help or contribute their skills, with contributions reflected in their profiles and the opportunity to earn badges based on their involvement. Overall, the app will create an inclusive and supportive online community for students to network, collaborate, and learn from each other.',
      'technology': 'Flutter, Dart, FireBase',
      'status': 'OnGoing',
      'feedback': 'Project is executing smoothly!!',
      'groupMembers': ['Nikunj', 'Uday', 'Vraj'],
    },
    {
      'name': 'Project 2',
      'description': 'Description of Project 2',
      'technology': 'Technology of Project 2',
      'status': 'Status of Project 2',
      'feedback': 'Feedback of Project 2',
      'groupMembers': ['Member 4', 'Member 5'],
    },
    {
      'name': 'Project 3',
      'description': 'Description of Project 3',
      'technology': 'Technology of Project 3',
      'status': 'Status of Project 3',
      'feedback': 'Feedback of Project 3',
      'groupMembers': ['Member 6', 'Member 7', 'Member 8'],
    },
  ];

  return ListView.builder(
    itemCount: projectsData.length,
    itemBuilder: (context, index) {
      Map<String, dynamic> projectData = projectsData[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyProjectHistory(
                title: projectData['name'],
                description: projectData['description'],
                technology: projectData['technology'],
                status: projectData['status'],
                feedback: projectData['feedback'],
                groupMembers: List<String>.from(projectData['groupMembers']),
              ),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(projectData['name']),
            // You can customize the ListTile as needed
          ),
        ),
      );
    },
  );
}


  Widget buildContributionHistoryTab() {
  // Dummy list of project details
  List<Map<String, dynamic>> projects = [
    {
      'name': 'Student Hub: Mobile Application',
      'description': 'The mobile application will provide a user-friendly platform for students to easily connect, collaborate, and share ideas. Key functionalities will include secure user authentication via mobile number, a seamless post sharing and viewing system to facilitate idea exchange, a comprehensive profile update section for students to showcase their skills and experiences, a robust peer-to-peer connection and chat feature for seamless communication, and a collaborative project assistance system where students can seek help or contribute their skills, with contributions reflected in their profiles and the opportunity to earn badges based on their involvement. Overall, the app will create an inclusive and supportive online community for students to network, collaborate, and learn from each other.',
      'technology': 'Flutter, Dart, FireBase',
      'status': 'OnGoing',
      'feedback': 'Project is executing smoothlly!!',
      'groupMembers': ['Nikunj', 'Uday', 'Vraj'],
      'projectBy': 'Jeet-0510',
    },
    {
      'name': 'Project 2',
      'description': 'Description of Project 2',
      'technology': 'Technology of Project 2',
      'status': 'Status of Project 2',
      'feedback': 'Feedback of Project 2',
      'groupMembers': ['Member 4', 'Member 5'],
      'projectBy': 'User B',
    },
    {
      'name': 'Project 3',
      'description': 'Description of Project 3',
      'technology': 'Technology of Project 3',
      'status': 'Status of Project 3',
      'feedback': 'Feedback of Project 3',
      'groupMembers': ['Member 6'],
      'projectBy': 'User C',
    },
  ];

  return ListView.builder(
    itemCount: projects.length,
    itemBuilder: (context, index) {
      Map<String, dynamic> project = projects[index];
      String projectName = project['name'];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContributionHistory(
                title: projectName,
                description: project['description'],
                technology: project['technology'],
                status: project['status'],
                feedback: project['feedback'],
                groupMembers: project['groupMembers'],
                projectBy: project['projectBy'], // New field
              ),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(projectName),
            // You can customize the ListTile as needed
          ),
        ),
      );
    },
  );
}

}
