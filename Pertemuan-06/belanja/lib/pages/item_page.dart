import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(itemArgs.name)),
      body: Column(
        children: [
          Hero(
            tag: itemArgs.name,
            child: Image.asset(itemArgs.image, height: 200),
          ),
          const SizedBox(height: 12),
          Text("Harga: Rp ${itemArgs.price}", style: const TextStyle(fontSize: 18)),
          Text("Stok: ${itemArgs.stock}", style: const TextStyle(fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text(itemArgs.rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}