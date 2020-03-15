import 'package:flutter/material.dart';

class MessagesTab extends StatefulWidget {
  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Messages'),
      ),
    );
  }
}
