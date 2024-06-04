import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<dynamic> list;
  const ListScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Center(child: Text(list[index]));
        },
        itemCount: list.length,
      ),
    );
  }
}
