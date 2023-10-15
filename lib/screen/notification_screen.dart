import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final title;
  final message;

  const NotificationScreen({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}
