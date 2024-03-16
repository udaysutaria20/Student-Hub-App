import 'package:flutter/material.dart';

class ContributionHistory extends StatelessWidget {
  final String title;
  final String description;
  final String technology;
  final String status;
  final String feedback;
  final List<String> groupMembers;
  final String projectBy; // New field for Project By

  const ContributionHistory({
    Key? key,
    required this.title,
    required this.description,
    required this.technology,
    required this.status,
    required this.feedback,
    required this.groupMembers,
    required this.projectBy, // Updated constructor to include projectBy
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow('Project By:', projectBy),
            const SizedBox(height: 8),
            _buildRow('Project Title:', title),
            const SizedBox(height: 8),
            _buildColumn('Description:', description),
            const SizedBox(height: 8),
            _buildColumn('Technology:', technology),
            const SizedBox(height: 8),
            _buildRow('Status:', status),
            const SizedBox(height: 8),
            _buildColumn('Feedback:', feedback),
            const SizedBox(height: 8),
            const Text(
              'Group Members:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: groupMembers
                  .map((member) => Text(
                        member,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
