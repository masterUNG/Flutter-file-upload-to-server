import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  // Field
  File file;

  // Method

  Future<void> takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      file = image;
    });
  }

  Widget showText() {
    return Text('App Photo');
  }

  Widget showImage(){
    return Image.file(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Photo'),
      ),
      body: Center(
        child: file == null ? showText() : showImage(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: () {
          takePhoto();
        },
      ),
    );
  }
}
