import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  const Profile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Color.fromRGBO(63, 61, 86, 1),
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 8),
        ClipOval(
          child: Image.asset(
            "assets/images/profile_pic.jpg",
            width: 42,
            height: 42,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
