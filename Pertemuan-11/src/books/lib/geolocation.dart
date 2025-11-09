import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));

    if (!kIsWeb) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }
    } else {
      debugPrint('Web: izin lokasi ditangani oleh browser.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location ')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              // ✅ Langkah 5: Tambahkan handling error
              if (snapshot.hasError) {
                return const Text('Something terrible happened!');
              }
              // Jika tidak ada error, tampilkan posisi
              return Text(
                'Latitude: ${snapshot.data!.latitude}\n'
                'Longitude: ${snapshot.data!.longitude}',
                textAlign: TextAlign.center,
              );
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
