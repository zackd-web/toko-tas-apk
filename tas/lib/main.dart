import 'package:flutter/material.dart';
// ignore: unused_import
import 'product_details.dart';
import 'widget/banner.dart';
import 'widget/section_header.dart';
import 'widget/horizontal_product_list.dart';


// Entry point aplikasi
void main() {
  runApp(const TokoTas());
}

class TokoTas extends StatelessWidget {
  const TokoTas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rumah Tas Lucu',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Ini adalah halaman utama aplikasi kita
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 91, 228),
        elevation: 1,
        title: Text(
          'Rumah Tas Lucu',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 253, 253),
            fontWeight: FontWeight.bold,
            fontSize: 27,
            fontFamily: 'timesnewroman'
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: const Color.fromARGB(255, 253, 253, 253)),
            onPressed: () {
              // Fungsi untuk search nanti
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: const Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              // Fungsi untuk ke keranjang nanti
            },
          ),
        ],
      ),
      body: ListView(
        children: [
        const ImageBanner(),
        SizedBox(height: 16),
        // Ganti _buildSectionHeader('Terlaris Bulan Ini') dengan widget baru
        const SectionHeader(title: 'Terlaris Bulan Ini'),
        const HorizontalProductList(),

        const SectionHeader(title: 'Produk Terbaru'),
        _buildProductGrid(),

        const SectionHeader(title: 'Barang Termurah'),
        const HorizontalProductList(),
      ],
      ),
    );
  }


  

  // WIDGET UNTUK KARTU PRODUK (Dipakai di list horizontal)
  Widget _buildProductCard(String name, String price, String imageUrl) {
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
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
          Text(price, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }

  // WIDGET UNTUK GRID PRODUK
  Widget _buildProductGrid() {
    // Data dummy lagi
    final List<Map<String, String>> products = [
      {'name': 'Tas Selempang Wanita', 'price': 'Rp. 80.000', 'image': 'https://s3.belanjapasti.com/media/image/dompet-resleting-koin-lomenia-korea-kecil-kucing-kitty-lucu-72868.jpg'},
      {'name': 'Tas Tali Rantai', 'price': 'Rp. 95.000', 'image': 'https://ds393qgzrxwzn.cloudfront.net/resize/c500x500/cat1/img/images/0/bfrQMMC2PC.jpg'},
      {'name': 'Dompet Kulit Mini', 'price': 'Rp. 55.000', 'image': 'https://i.pinimg.com/736x/f7/06/82/f70682d01931f964301783592e429d48.jpg'},
      {'name': 'Tas Bahu Casual', 'price': 'Rp. 70.000', 'image': 'https://ae01.alicdn.com/kf/S4e15a4824451481bbd9ec3cb824014c1m.jpg'},
      {'name': 'Tas Bahu Casual', 'price': 'Rp. 70.000', 'image': 'https://ae01.alicdn.com/kf/S4e15a4824451481bbd9ec3cb824014c1m.jpg'},
      {'name': 'Tas Bahu Casual', 'price': 'Rp. 70.000', 'image': 'https://ae01.alicdn.com/kf/S4e15a4824451481bbd9ec3cb824014c1m.jpg'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true, // Penting agar GridView di dalam ListView tidak error
        physics: NeverScrollableScrollPhysics(), // Biar scroll utama pakai ListView
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,       // 2 kolom
          crossAxisSpacing: 16,    // Jarak horizontal antar item
          mainAxisSpacing: 1,     // Jarak vertikal antar item
          childAspectRatio: 0.75,  // Rasio lebar:tinggi setiap item
        ),
        itemBuilder: (context, index) {
          return _buildProductCard(
            products[index]['name']!,
            products[index]['price']!,
            products[index]['image']!,
          );
        },
      ),
    );
  }
}