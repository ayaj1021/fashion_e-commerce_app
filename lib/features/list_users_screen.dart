import 'package:flutter/material.dart';

class ListUsersScreen extends StatelessWidget {
  const ListUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('List of users'))
    );
  }
}