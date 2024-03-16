import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:firebase_database/ui/firebase_animated_list.dart";
import 'package:url_launcher/url_launcher.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final databaseRef = FirebaseDatabase.instance.ref().child('User').child('Jeet-0510').child('Profile').child('Skills');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Column(
        children: [
          ExpansionTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: Container(
                child: Image.asset("assets/images/code.png"),
                margin: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            title:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Programming Language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            children: [
              SingleChildScrollView(child: skillListing("Language")),
            ],
            trailing: IconButton(
              icon: Icon(Icons.add_circle_outline, size: 30),
              onPressed: () {
                showAddDialog("Language");
              },
            ),
          ),
          ExpansionTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: Container(
                child: Image.asset("assets/images/framework.png"),
                margin: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            title:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Frameworks/Libraries",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            children: [
              SingleChildScrollView(child: skillListing("Frameworks")),
            ],
            trailing: IconButton(
              icon: Icon(Icons.add_circle_outline, size: 30),
              onPressed: () {
                showAddDialog("Frameworks");
              },
            ),
          ),
          ExpansionTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: Container(
                child: Image.asset("assets/images/computer.png"),
                margin: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            title:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Tools",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            children: [
              SingleChildScrollView(child: skillListing("Tools")),
            ],
            trailing: IconButton(
              icon: Icon(Icons.add_circle_outline, size: 30),
              onPressed: () {
                showAddDialog("Tools");
              },
            ),
          ),
          ExpansionTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: Container(
                child: Image.asset("assets/images/collaboration.png"),
                margin: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            title:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Platforms",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            children: [
              SingleChildScrollView(child: skillListing("Platforms")),
            ],
            trailing: IconButton(
              icon: Icon(Icons.add_circle_outline, size: 30),
              onPressed: () {
                showAddDialog("Platforms");
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget skillListing(String node) {
    return Container(
      height: 200,
      child: FirebaseAnimatedList(
        query: databaseRef.child(node),
        itemBuilder: (context, snapshot, animation, index) {
          dynamic data = snapshot.value;

          // if (data == null || data is! Map<String, dynamic>) {
          //   return Container(); // Return an empty container if data is null or not a Map<String, dynamic>
          // }

          // Extract 'title' and 'verification' values with fallbacks to empty strings
          String title = data['title'].toString();
          String verification = data['verification'].toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(title),
              subtitle: InkWell(
                onTap: () {
                  launch(verification); // Use the 'verification' URL here
                },
                child: Text("Verification"),
              ),
              trailing: Text("update / delete"),
            ),
          );
        },
      ),
    );
  }





  Future<void> showAddDialog(String sectionKey, [String? sectionName]) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController verificationController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add ${sectionName ?? ''}"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Set to min to make it compact
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter ${sectionName ?? 'Title'}",
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: verificationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Verification Link ",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Process the entered values
                String title = titleController.text;
                String verification = verificationController.text;

                // Add your logic to handle the entered values and sectionKey
                // For example: databaseRef.child(sectionKey).push().set({'title': title, 'verification': verification});

                if (title.isNotEmpty && verification.isNotEmpty) {
                  databaseRef.child(sectionKey).push().set({
                    'title': title,
                    'verification': verification,
                  });
                }

                Navigator.pop(context); // Close the dialog
              },
              child: Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }



}
