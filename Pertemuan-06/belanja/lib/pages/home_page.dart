import 'package:belanja/models/item.dart';
// import 'package:belanja/pages/item_page.dart';
// import 'package:belanja/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(title: Text("Toko Belanja")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              context.push('/item', extra: item);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: item.name,
                    child: Image.asset(item.image, height: 100),
                  ),
                  SizedBox(height: 8),
                  Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Rp ${item.price}"),
                  Text("Stock: ${item.stock}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text("${item.rating}")
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Diana Rahmawati - 2341720162",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
