import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';

import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

final captionController = TextEditingController();
late DatabaseReference dbref;
@override
void initState() {
  dbref = FirebaseDatabase.instance.ref('Post');
}

class _AddPostState extends State<AddPost> {

  XFile? _imageFile;
  Uint8List? _imageBytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Submit a document',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add code here when the user taps on the profile picture
                      },
                      child: CircleAvatar(
                        radius: 25,
                        foregroundImage:
                        ExactAssetImage('assets/images/dhoni.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: captionController,
                        expands: true,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: 'Write a caption...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    buildImageDisplay(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _getFromCamera();
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          ),
                        ),
        
                        IconButton(
                          onPressed: () {
                            _getFromGallery();
                          },
                          icon: Icon(
                            Icons.image_outlined,
                            color: Colors.blue,
                          ),
                        ),
        
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                child: Text(
                  'Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  _uploadImage();
                },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  // Add code here when the user taps on the save as draft button
                },
                child: Text(
                  'Save as draft',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300]!,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageDisplay() {
    return _imageBytes == null
        ? Text('No image selected.')
        : Image.memory(
      _imageBytes!,
      width: 150,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  Future<void> _getFromCamera() async {
    XFile? image =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _imageFile = image;
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _getFromGallery() async {
    XFile? image =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _imageFile = image;
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageBytes == null) {
      // No image to upload
      return;
    }

    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('${DateTime.now()}.png');

      await ref.putData(_imageBytes!);

      String downloadURL = await ref.getDownloadURL();

      // Print the download URL, you can use this to display the image
      print("Download URL: $downloadURL");
      // Image.network(downloadURL);
      // You can use this download URL to display the image, or store it in Firestore, etc.
    } catch (e) {
      print(e.toString());
      // Handle any exceptions that occur
    }
  }
}
