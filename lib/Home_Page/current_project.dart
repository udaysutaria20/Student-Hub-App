import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CurrentProject extends StatelessWidget {
  CurrentProject({super.key});

  List<Tab> tabs = [
    const Tab(child: Text('My Project')),
    const Tab(child: Text('Contributions')),
  ];

  List<Widget> tabsContent = [
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Current Projects',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.white),
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
            buildMyProjectTab(),
            buildContributionTab(),
            // buildOngoingProjectTab(),
          ],
        ),
      ),
    );
  }

  Widget buildMyProjectTab() {
    // Dummy list of project names
    List<String> projectNames = [
      'Project 1',
      'Project 2',
      'Project 3',
      // Add more project names as needed
    ];

    return ListView.builder(
      itemCount: projectNames.length,
      itemBuilder: (context, index) {
        String projectName = projectNames[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(projectName),
            // You can customize the ListTile as needed
          ),
        );
      },
    );

    // color: const Color.fromARGB(255, 180, 203, 65);
  }

  Widget buildContributionTab() {
    // Dummy list of project names
    List<String> projectNames = [
      'Project 1',
      'Project 2',
      'Project 3',
      // Add more project names as needed
    ];

    return ListView.builder(
      itemCount: projectNames.length,
      itemBuilder: (context, index) {
        String projectName = projectNames[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(projectName),
            // You can customize the ListTile as needed
          ),
        );
      },
    );
  }
}
