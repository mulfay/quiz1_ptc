import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String image;
  final String about;
  const User({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.about,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              image,
            ),
            radius: 100,
          ),
          Text(
            firstName,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            lastName,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            about,
            style: const TextStyle(fontSize: 20),
          ),
        ]),
      ),
    );
  }
}
