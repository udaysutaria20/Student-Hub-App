import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:firebase_database/ui/firebase_animated_list.dart";

class AchievementList extends StatefulWidget{
  const AchievementList({Key? key}) : super(key: key);

  @override
  State<AchievementList> createState() => _AchievementListState();
}

class _AchievementListState extends State<AchievementList> {
  final databaseRef = FirebaseDatabase.instance.ref().child('User').child('Jeet-0510').child('Profile').child('Achievements');

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 55.0, left: 15.0, right: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              child: Text(
                'ADD ACHIEVEMENT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAchievement()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 3.0,
                      child: ListTile(
                        title: Text("Achievement $index", style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("Description", style: TextStyle(color: Colors.grey)),
                        trailing: Text("Duration", style: TextStyle(color: Colors.grey)), // You can replace this with your custom icon
                      ),
                    );
                  },
                ),
              ),
            ),
            // ShowAchievements(),



          ],
        ),
      ),
    );
  }
}

class ShowAchievements extends StatefulWidget {
  const ShowAchievements({Key? key}) : super(key: key);

  @override
  State<ShowAchievements> createState() => _ShowAchievementsState();
}

class _ShowAchievementsState extends State<ShowAchievements> {
  final databaseRef =
  FirebaseDatabase.instance.ref().child('User').child('Jeet-0510').child('Profile').child('Achievements');

  @override
  Widget build(BuildContext context) {
    print(databaseRef.child("ID"));
    return SizedBox(
      height: 200,
      child: FirebaseAnimatedList(
        query: databaseRef.child("ID"),
        itemBuilder: (context, snapshot, animation, index) {
          if (snapshot.value == null) {
            return Container(); // Return an empty container if the snapshot is null
          }

          dynamic data = snapshot.value;

          if (data is! Map<String, dynamic>) {
            return Container(); // Return an empty container if data is not a Map<String, dynamic>
          }

          String achievementTitle = (data as Map<String, dynamic>)['achievementtitle']?.toString() ?? '';
          String description = (data as Map<String, dynamic>)['description']?.toString() ?? '';
          String duration = (data as Map<String, dynamic>)['duration']?.toString() ?? '';

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              // Customize the card appearance as needed
              child: ListTile(
                title: Text(achievementTitle),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description: $description'),
                    Text('Duration: $duration'),
                  ],
                ),
                trailing: Text("update / delete"),
              ),
            ),
          );
        },
      ),
    );
  }



}


class AddAchievement extends StatefulWidget {
  const AddAchievement({Key? key}) : super(key: key);

  @override
  _AddAchievementState createState() => _AddAchievementState();
}

class _AddAchievementState extends State<AddAchievement> {
  final databaseRef = FirebaseDatabase.instance.ref().child('User').child('Jeet-0510').child('Profile').child('Achievements');
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Achievement'),
      ),
      body: SingleChildScrollView(
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
                  // ... other decoration properties
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: null,
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  // ... other decoration properties
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: null,
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Time Duration',
                  border: OutlineInputBorder(),
                  // ... other decoration properties
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle submit button click
                  String title = titleController.text;
                  String description = descriptionController.text;
                  String time = timeController.text;

                  // Add your logic for submitting the data
                  databaseRef.child("ID").set({
                    'achievementtitle': title,
                    'description': description,
                    'duration': time,
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

