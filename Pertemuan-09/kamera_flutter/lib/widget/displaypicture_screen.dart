import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2341720162')),
      body: Center(
        child: kIsWeb
            // Jika dijalankan di Web → tampilkan gambar dengan Image.network
            ? Image.network(imagePath)
            // Jika dijalankan di Android/iOS → tampilkan gambar dari File
            : Image.file(File(imagePath)),
      ),
    );
  }
}
