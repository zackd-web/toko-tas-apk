import 'package:flutter/material.dart';

// WIDGET UNTUK JUDUL SECTION 

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'timesnewroman',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Lainnya',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'timesnewroman',
              color: Color.fromARGB(255, 16, 74, 223),
            ),
          ),
        ],
      ),
    );
  }
}