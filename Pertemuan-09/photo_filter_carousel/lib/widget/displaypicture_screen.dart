import 'dart:io' show File;
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'filter_selector.dart';
import 'filter_item.dart';
import 'carousel_flowdelegate.dart';
import 'dart:math' as math;
import 'package:path/path.dart';

class DisplayPictureScreen extends StatefulWidget {
  final Uint8List? imageBytes;
  final String? imagePath;

  const DisplayPictureScreen({super.key, this.imageBytes, this.imagePath});
  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);
  Uint8List? _imageBytes;

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _loadWebImage();
    }
  }

  Future<void> _loadWebImage() async {
    // Baca bytes dari XFile (via path yang dikirim dari takePicture())
    if (widget.imagePath == null) {
      debugPrint('Tidak ada path gambar untuk dimuat di Web.');
      return;
    }
    try {
      final bytes = await File(widget.imagePath!).readAsBytes();
      setState(() => _imageBytes = bytes);
    } catch (e) {
      debugPrint('Gagal memuat gambar di Web: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Foto Kamu')),
      body: Stack(
        children: [
          Positioned.fill(child: _buildPhotoWithFilter()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        Widget imageWidget;

        if (kIsWeb && widget.imageBytes != null) {
          imageWidget = Image.memory(
            widget.imageBytes!,
            color: color.withOpacity(0.5),
            colorBlendMode: BlendMode.color,
            fit: BoxFit.cover,
          );
        }

        return imageWidget;
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(onFilterChanged: _onFilterChanged, filters: _filters);
  }
}
