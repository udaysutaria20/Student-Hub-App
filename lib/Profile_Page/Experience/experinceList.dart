import 'package:flutter/material.dart';

class ExperienceList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SizedBox(
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
                title: Text("Experience $index", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Description", style: TextStyle(color: Colors.grey)),
                trailing: Text("Duration", style: TextStyle(color: Colors.grey)), // You can replace this with your custom icon
              ),
            );
          },
        ),
      ),
    );
  }
}