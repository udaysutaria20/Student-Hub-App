import 'package:flutter/material.dart';
import 'login.dart';

class ViewSlider extends StatefulWidget {
  const ViewSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ViewSliderState createState() => _ViewSliderState();
}

class _ViewSliderState extends State<ViewSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _slideData = [
    {
      'image': 'assets/images/collabaration.jpg',
      'title': 'Contributions',
      'description': 'Showing initiative and effort towards things that are important and volunteering for the same is necessary',
    },
    
    {
      'image': 'assets/images/connection.jpg',
      'title': 'Connections',
      'description': 'Youth who feel connected at school are significantly less likely to experience health risks related to sexual health.',
      
    },
    {
      'image': 'assets/images/share ideas.jpg',
      'title': 'Share Ideas',
      'description': 'Asked students to share ideas and experiences with others whose backgrounds and viewpoints differ from their own.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 47, 152, 237),
          title: const Text(
            'Student Hub',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if (_currentPage != _slideData.length - 1)
            TextButton(
              onPressed: () {
                _pageController.jumpToPage(_slideData.length - 1);
              },
              child: const Text(
                'Skip >>',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _slideData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _buildSlide(index);
            },
          ),
          if (_currentPage == _slideData.length - 1)
            Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text('Login',

                    style: TextStyle(fontSize: 24,
                    color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSlide(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          _slideData[index]['image'],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20.0),
        Text(
          _slideData[index]['title'],
          style: const TextStyle(fontSize: 34.0, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10.0),
        Text(
          _slideData[index]['description'],
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
