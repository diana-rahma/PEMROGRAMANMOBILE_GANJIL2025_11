
import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: item.name,
              child: Image.asset(item.image, height: 200),
            ),
            SizedBox(height: 16),
            Text(item.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Rp ${item.price}", style: TextStyle(fontSize: 18)),
            Text("Stock: ${item.stock}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text("${item.rating}")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
