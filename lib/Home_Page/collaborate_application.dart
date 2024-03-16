import 'package:flutter/material.dart';

class CollaborateApplication extends StatefulWidget {
  final String projectPerson;
  final String title;
  final String description;
  final String technology;

  const CollaborateApplication({
    super.key,
    required this.projectPerson,
    required this.title,
    required this.description,
    required this.technology,
  });

  @override
  State<CollaborateApplication> createState() => _CollaborateApplicationState();
}

class _CollaborateApplicationState extends State<CollaborateApplication> {
  TextEditingController contributionController = TextEditingController();
  bool isSubmitEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply for Contribution',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Project Added by: ${widget.projectPerson}',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 132, 218),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Project Title:',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.title,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              const Text(
                'Project Description:',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              const Text(
                'Technology:',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.technology,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: contributionController,
                maxLines: null,
                onChanged: (text) {
                  setState(() {
                    // Enable or disable the button based on whether the text field is empty
                    isSubmitEnabled = text.isNotEmpty;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'How would you like to contribute?*',
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
                onPressed: isSubmitEnabled
                    ? () {
                        // Handle submit button click
                      }
                    : null, // Disable the button if isSubmitEnabled is false
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
