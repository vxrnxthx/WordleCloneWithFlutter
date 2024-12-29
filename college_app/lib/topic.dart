import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopicScreen extends StatelessWidget {
  final int tabIndex;

  TopicScreen({required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchContent(tabIndex),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading content.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No content available.'));
        } else {
          var content = snapshot.data!;
          return ListView.builder(
            itemCount: content.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(content[index]['title']),
                subtitle: Text(content[index]['description']),
                leading: Image.network(content[index]['thumbnail']), // Display the thumbnail
              );
            },
          );
        }
      },
    );
  }

  // Fetch content from Firestore
  Future<List<Map<String, dynamic>>> fetchContent(int tabIndex) async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('topics').doc('tab$tabIndex').collection('content').get();

    return snapshot.docs.map((doc) => {
      'title': doc['title'],
      'description': doc['description'],
      'thumbnail': doc['thumbnail'], // Image URL from Firebase Storage
    }).toList();
  }
}
