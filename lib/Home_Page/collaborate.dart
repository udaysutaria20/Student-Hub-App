import 'package:flutter/material.dart';

import 'collaborate_application.dart';
class Collaborate extends StatelessWidget {
  const Collaborate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove the app bar elevation
        backgroundColor: Colors.transparent, // Make the app bar transparent
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // Take maximum width available
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildProjectCard(
              context,
              'Jeet-0510',
              'Student Hub: Mobile Application',
              'The mobile application will provide a user-friendly platform for students to easily connect, collaborate, and share ideas. Key functionalities will include secure user authentication via mobile number, a seamless post sharing and viewing system to facilitate idea exchange, a comprehensive profile update section for students to showcase their skills and experiences, a robust peer-to-peer connection and chat feature for seamless communication, and a collaborative project assistance system where students can seek help or contribute their skills, with contributions reflected in their profiles and the opportunity to earn badges based on their involvement. Overall, the app will create an inclusive and supportive online community for students to network, collaborate, and learn from each other.',
              'Flutter, Dart, FireBase', '1200'),
          const SizedBox(height: 16),
          buildProjectCard(context, 'Jeet-0510', 'Project 2', 'Description 2',
              'Technology 2', '0'),
          const SizedBox(height: 16),
          buildProjectCard(context, 'Jeet-0510', 'Project 3', 'Description 3',
              'Technology 3', '500'),
          // Add more project cards as needed
        ],
      ),
    );
  }

  Widget buildProjectCard(BuildContext context, String projectPerson,
      String title, String description, String technology, String price) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Added by: $projectPerson',
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 26, 132, 218),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Project Title:',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              title,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            const Text(
              'Project Description:',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            const Text(
              'Technology:',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              technology,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            const Text(
              'Price:',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              price,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to a new page with card data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CollaborateApplication(
                        projectPerson: projectPerson,
                        title: title,
                        description: description,
                        technology: technology,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor:
                      const Color.fromARGB(255, 41, 151, 7), // Set text color
                ),
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}