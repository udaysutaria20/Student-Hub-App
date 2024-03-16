import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:student/HomeSection/my_project_application.dart';

import 'my_project_application.dart';

class AddHelp extends StatefulWidget {
  const AddHelp({super.key});

  @override
  State<AddHelp> createState() => _AddHelpState();
}

// final nameController = TextEditingController();
final databaseReference = FirebaseDatabase.instance.ref("User");
final databaseReference1 = FirebaseDatabase.instance.ref("Project");


class _AddHelpState extends State<AddHelp> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController technologyController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  List<Tab> tabs = [
    const Tab(child: Text('Add Project')),
    const Tab(child: Text('Applications')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Projects',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: TabBar(
                tabs: tabs,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                indicatorColor: Colors.white,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(
                    horizontal:
                    MediaQuery.of(context).size.width / tabs.length / 6),
              )),
        ),
        body: TabBarView(
          children: [
            buildAddProjectTab(),
            buildApplicationsTab(context),
            // buildOngoingProjectTab(),
          ],
        ),
      ),
    );
  }

  Widget buildAddProjectTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              maxLines: null,
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Project Title',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: null,
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Color.fromARGB(255, 46, 16, 16)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: null,
              controller: technologyController,
              decoration: const InputDecoration(
                labelText: 'Skills/Tech Required',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: null,
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price: ',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle submit button click
                String title = titleController.text;
                String description = descriptionController.text;
                String technology = technologyController.text;
                String price = priceController.text;
                DateTime currentDateTime = DateTime.now();
                // Add your logic for submitting the data

                databaseReference.child("Jeet-0510").child("MyProject").child(currentDateTime.toIso8601String().replaceAll(RegExp(r'[^\w\s]+'), '-')).child("ProjectDetails").set({
                  'projecttitle': title,
                  'description': description,
                  'technology': technology,
                  'price': price,
                });

                databaseReference.child("Jeet-0510").child("MyProject").child(currentDateTime.toIso8601String().replaceAll(RegExp(r'[^\w\s]+'), '-')).child("ProjectStatus").set({
                  'projectStatus': 0,
                });

                //Project
                databaseReference1.child(title).set({
                  'projecttitle': title,
                  'description': description,
                  'technology': technology,
                  'userName': 'Jeet-0510',
                  'projectStatus':0,
                  'price': price,
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Set text color
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildApplicationsTab(BuildContext context) {
    // Dummy list of project names
    List<String> projectNames = [
      'Project 1',
      'Project 2',
      'Project 3',
      // Add more project names as needed
    ];

    if (projectNames.isEmpty) {
      return const Center(
        child: Text(
          'No Project Applications',
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: projectNames.length,
        itemBuilder: (context, index) {
          String projectName = projectNames[index];
          return GestureDetector(
            onTap: () {
              // Handle project tile click
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProjectApplication(projectName),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
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
}