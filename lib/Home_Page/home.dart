import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostScreen(),
    );
  }
}

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> posts = [
    Post(
      user: 'uday sutaria',
      description: 'Description of the post 1 goes here',
      imageUrl: 'assets/images/post1.jpg', // Placeholder image URL
    ),
    Post(
      user: 'vraj desai',
      description: 'Description of the post 2 goes here',
      imageUrl: 'assets/images/2.png', // Placeholder image URL
    ),
    Post(
      user: 'Nikunj Detroja',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/4.png', // Placeholder image URL
    ),
    Post(
      user: 'hemant shah',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/1.png', // Placeholder image URL
    ),
    Post(
      user: 'Khushi Patel',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/3.png', // Placeholder image URL
    ),
    Post(
      user: 'Dhruvi Shah',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/3.png', // Placeholder image URL
    ),
    Post(
      user: 'Umang Patel',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/4.png', // Placeholder image URL
    ),
    Post(
      user: 'Parth Shah',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/1.png', // Placeholder image URL
    ),
    Post(
      user: 'Mahek Patel',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/3.png', // Placeholder image URL
    ),
    Post(
      user: 'Vadan Patel',
      description: 'Description of the post 3 goes here',
      imageUrl: 'assets/images/4.png', // Placeholder image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Hub'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(post: posts[index]);
        },
      ),
    );
  }
}

class Post {
  final String user;
  final String description;
  final String imageUrl;

  Post({required this.user, required this.description, required this.imageUrl});
}

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int likes = 0;
  bool liked = false;
  List<Comment> comments = [];

  void toggleLike() {
    setState(() {
      if (liked) {
        likes--;
      } else {
        likes++;
      }
      liked = !liked;
    });
  }

  void addComment(String username, String commentText) {
    setState(() {
      comments.add(Comment(username: username, text: commentText));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('assets/images/post1.jpg'), // Default profile image URL
              // Placeholder image for profile photo
            ),
            title: Text(widget.post.user),
            subtitle: Text(widget.post.description),
          ),
          // Image below description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              widget.post.imageUrl,
              height: 450,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. '
                  'Sed nisi. Nulla quis sem at nibh elementum imperdiet.',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : null,
                ),
                onPressed: toggleLike,
              ),
              Text(
                '$likes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Add Comment'),
                        content: TextField(
                          decoration: InputDecoration(hintText: 'Enter your comment'),
                          onChanged: (value) {
                            // Handle text input
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add comment logic
                              String username = 'User'; // Replace with the actual username
                              String commentText = 'New Comment';
                              addComment(username, commentText);
                              Navigator.of(context).pop();
                            },
                            child: Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Divider(),
          if (comments.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Comments:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Display comments in an Instagram-like format
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${comments[index].username}:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(comments[index].text),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class Comment {
  final String username;
  final String text;

  Comment({required this.username, required this.text});
}