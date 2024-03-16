import 'package:flutter/material.dart';

class MyProjectApplication extends StatelessWidget {
  final String projectName;

  const MyProjectApplication(this.projectName, {super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of user applications
    List<UserApplication> userApplications = [
      UserApplication(username: 'User 1', contribution: 'Contribution 1'),
      UserApplication(username: 'User 2', contribution: 'Contribution 2'),
      UserApplication(username: 'User 3', contribution: 'Contribution 3'),
      // Add more user applications as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Project Applications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: userApplications.length,
        itemBuilder: (context, index) {
          UserApplication application = userApplications[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Username: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        application.username,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'How would you like to contribute?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    application.contribution,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle accept button click
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          backgroundColor: const Color.fromARGB(
                              255, 41, 151, 7), // Set text color
                        ),
                        child: const Text('Accept'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle decline button click
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 243, 33, 33), // Set text color
                        ),
                        child: const Text('Decline'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserApplication {
  final String username;
  final String contribution;

  UserApplication({required this.username, required this.contribution});
}
