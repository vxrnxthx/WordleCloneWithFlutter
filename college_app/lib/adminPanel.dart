import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image;

  Future<void> _uploadContent() async {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    // Upload image to Firebase Storage
    final storageRef = FirebaseStorage.instance.ref().child('thumbnails/${_image!.name}');
    await storageRef.putFile(File(_image!.path)); // Upload the selected image
    final imageUrl = await storageRef.getDownloadURL(); // Get the URL of the uploaded image

    // Save content data in Firestore
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('topics').doc('tab1').collection('content').add({
      'title': _titleController.text,
      'description': _descriptionController.text,
      'thumbnail': imageUrl, // Store the image URL in Firestore
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Content uploaded successfully')));
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 10),
            if (_image != null) Image.file(File(_image!.path), height: 100),
            Spacer(),
            ElevatedButton(
              onPressed: _uploadContent,
              child: Text('Upload Content'),
            ),
          ],
        ),
      ),
    );
  }
}
