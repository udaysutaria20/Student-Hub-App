
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:firebase_database/ui/firebase_animated_list.dart";

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final databaseRef =
  FirebaseDatabase.instance.ref().child('User').child('Jeet-0510').child('MyProject');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildFirebaseAnimatedList('ID'),
        ],
      ),
    );
  }


  Widget buildFirebaseAnimatedList(String childId) {
    return Container(
      height: 600,
      // color: Colors.red,
      child: FirebaseAnimatedList(
        query: databaseRef.child(childId),
        itemBuilder: (context, snapshot, animation, index) {
          var projectDetails = snapshot.value as Map<dynamic, dynamic>?;

          if (projectDetails == null) {
            return SizedBox.shrink(); // Skip if data is null
          }

          return ProjectCard(projectDetails);
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<dynamic, dynamic> projectDetails;

  ProjectCard(this.projectDetails);

  @override
  Widget build(BuildContext context) {
    var description = projectDetails['description'];
    var projectTitle = projectDetails['projecttitle'];
    var technology = projectDetails['technology'];

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
                title: Text("Project $index", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Description", style: TextStyle(color: Colors.grey)),
                trailing: Text("Duration", style: TextStyle(color: Colors.grey)), // You can replace this with your custom icon
              ),
            );
          },
        ),
      ),
    );

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 15.0),
//               child: ListTile(
//                 title: Text(projectTitle ?? 'No Title'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(technology),
//                     SizedBox(height: 8),
//                     DescriptionWidget(description),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('UPDATE'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('DELETE'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DescriptionWidget extends StatefulWidget {
//   final String? description;
//
//   const DescriptionWidget(this.description);
//
//   @override
//   _DescriptionWidgetState createState() => _DescriptionWidgetState();
// }

// class _DescriptionWidgetState extends State<DescriptionWidget> {
//   bool showFullText = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           showFullText = !showFullText;
//         });
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Description:',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(
//             showFullText ? widget.description! : truncateDescription(widget.description),
//           ),
//           if (widget.description!.length > 60) // You can adjust the threshold as needed
//             Text(
//               showFullText ? 'Show Less' : 'Show More',
//               style: TextStyle(color: Colors.blue),
//             ),
//         ],
//       ),
//     );
  }
//
//   String truncateDescription(String? description) {
//     if (description == null || description.length <= 60) {
//       return description ?? '';
//     }
//     return '${description.substring(0, 60)}...';
//   }
}