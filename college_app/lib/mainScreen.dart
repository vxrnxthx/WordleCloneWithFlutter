import 'package:flutter/material.dart';
import 'topic.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Adjust the number of tabs based on your content
      child: Scaffold(
        appBar: AppBar(
          title: Text('PRIME'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1', icon: Icon(Icons.topic)),
              Tab(text: 'Tab 2', icon: Icon(Icons.topic)),
              Tab(text: 'Tab 3', icon: Icon(Icons.topic)),
              Tab(text: 'Tab 4', icon: Icon(Icons.topic)),
              Tab(text: 'Tab 5', icon: Icon(Icons.topic)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TopicScreen(tabIndex: 1),
            TopicScreen(tabIndex: 2),
            TopicScreen(tabIndex: 3),
            TopicScreen(tabIndex: 4),
            TopicScreen(tabIndex: 5),
          ],
        ),
      ),
    );
  }
}
