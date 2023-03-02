import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  final image;
  final String name;
  Tiles({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 5)],
            color: Colors.indigo.shade600,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
