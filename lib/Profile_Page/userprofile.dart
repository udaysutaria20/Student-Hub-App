import 'package:flutter/material.dart';
import 'package:student_profile/Home_Page/home.dart';
import 'package:student_profile/Profile_Page/About/aboutSection.dart';
import 'package:student_profile/Profile_Page/Experience/experinceList.dart';
import 'package:student_profile/Profile_Page/profile_top_portion.dart';
import 'Achievements/achievementList.dart';
// import 'Achievements/achievementlist.dart';
import 'Posts/postList.dart';
import 'Projects/projectList.dart';
import 'Skills/SkillsPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: DefaultTabController(
                length: 6,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 45, right: 45),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Skills"),
                    Tab(text: "Projects"),
                    Tab(text: "Achievements"),
                    Tab(text: "Experience"),
                    Tab(text: "About"),
                    Tab(text: "Posts", )
                  ],
                ),
              ),
            ),
            pinned: true, // Set to false to allow full collapse
            expandedHeight: 290, // Set an explicit height
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  TopPortion(),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            // hasScrollBody: false, // Add this line
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(child: SkillsPage()),
                SingleChildScrollView(child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: ProjectList(),
                )),
                SingleChildScrollView(child: AchievementList()),
                SingleChildScrollView(child: ExperienceList()),
                SingleChildScrollView(child: About()),
                SingleChildScrollView(child: PostList())
              ],
            ),
          ),
        ],
      ),
    );
  }
}