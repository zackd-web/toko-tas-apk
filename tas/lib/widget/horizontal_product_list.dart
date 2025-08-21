import 'package:flutter/material.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'name': 'DOMPET LUNIRA', 'price': 'Rp. 33.000', 'image': 'https://i.pinimg.com/736x/e6/e8/e1/e6e8e198dff2e8d375d27d79ddfff821.jpg'},
      {'name': 'STERNA LC', 'price': 'Rp. 51.000', 'image': 'https://i.pinimg.com/736x/7b/1d/d9/7b1dd9ef2961b92c2cbe8049b881f55c.jpg'},
      {'name': 'SAVIRA BEHEL', 'price': 'Rp. 47.000', 'image': 'https://i.pinimg.com/736x/fc/fb/39/fcfb39ac2ebd9081ceabc4f8b2baf80c.jpg'},
      {'name': 'DOMPET RESLETING', 'price': 'Rp. 47.000', 'image': 'https://s3.belanjapasti.com/media/image/dompet-resleting-koin-lomenia-korea-kecil-kucing-kitty-lucu-72868.jpg'},
    ];

    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _ProductCard(
            name: products[index]['name']!,
            price: products[index]['price']!,
            imageUrl: products[index]['image']!,
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const _ProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
          Text(price, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}