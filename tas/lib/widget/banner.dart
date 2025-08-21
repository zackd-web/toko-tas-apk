import 'package:flutter/material.dart';

 // WIDGET UNTUK BANNER
class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
                'https://taskw.com/wp-content/uploads/2024/03/WhatsApp-Image-2024-03-12-at-09.25.301-800x800.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}