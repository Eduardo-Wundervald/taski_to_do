import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Taski",
          style: TextStyle(
            color: Color.fromRGBO(63, 61, 86, 1),
            fontFamily: "Urbanist",
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
