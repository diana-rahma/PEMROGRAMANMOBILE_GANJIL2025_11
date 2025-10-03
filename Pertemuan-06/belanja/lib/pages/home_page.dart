import 'package:belanja/models/item.dart';
// import 'package:belanja/pages/item_page.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: "Heels",
      price: 40000000,
      image: "images/sepatu.jpg",
      stock: 12,
      rating: 4.5,
    ),
    Item(
      name: "Tas",
      price: 10000000,
      image: "images/tas.jpg",
      stock: 7,
      rating: 4.7,
    ),
    Item(
      name: "Baju",
      price: 2500000,
      image: "images/baju.jpg",
      stock: 7,
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Belanja")),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(item: item);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Diana Rahmawati - 2341720162",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
