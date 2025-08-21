import 'package:flutter/material.dart';

// Halaman untuk menampilkan detail satu produk
class ProductDetailPage extends StatelessWidget {
  // Kita buat variabel untuk menampung data produk yang dikirim dari halaman sebelumnya
  final Map<String, dynamic> product;

  // Ini adalah constructor, tempat kita menerima data produknya
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul nama produk & tombol kembali otomatis
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      // Kita pakai ListView agar kontennya bisa di-scroll jika deskripsinya panjang
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 1. Gambar Produk
          _buildProductImage(),

          const SizedBox(height: 24),

          // 2. Nama & Harga Produk
          _buildProductTitleAndPrice(),

          const SizedBox(height: 16),

          // 3. Info Stok & Rating
          _buildStockAndRating(),

          const SizedBox(height: 24),

          // Garis pemisah
          const Divider(),

          const SizedBox(height: 16),

          // 4. Deskripsi Produk
          _buildProductDescription(),
        ],
      ),
      // Tombol Aksi di bagian bawah layar
      bottomNavigationBar: _buildBottomActionButton(context),
    );
  }

  // Widget untuk menampilkan gambar utama produk
  Widget _buildProductImage() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(product['image']),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Widget untuk menampilkan judul dan harga
  Widget _buildProductTitleAndPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product['name'],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product['price'],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }

  // Widget untuk menampilkan info stok dan rating
  Widget _buildStockAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Bagian Rating
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              product['rating'].toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        // Bagian Stok
        Text(
          'Tersisa ${product['stock']} stok',
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ],
    );
  }

  // Widget untuk menampilkan deskripsi
  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Deskripsi Produk',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product['description'],
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            height: 1.5, // Jarak antar baris
          ),
        ),
      ],
    );
  }

  // Widget untuk tombol di bagian bawah
  Widget _buildBottomActionButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Aksi ketika tombol ditekan, misal: menampilkan notifikasi
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product['name']} ditambahkan ke keranjang!')),
          );
        },
        child: const Text(
          'Tambah ke Keranjang',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}