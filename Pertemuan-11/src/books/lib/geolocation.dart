import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = 'Getting location...';

  @override
  void initState() {
    super.initState();
    getPosition()
        .then((Position myPos) {
          setState(() {
            myPosition =
                'Latitude: ${myPos.latitude} - Longitude: ${myPos.longitude}';
          });
        })
        .catchError((error) {
          setState(() {
            myPosition = 'Error: $error';
          });
        });
  }

  Future<Position> getPosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw Exception('Location service not enabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Di web, browser yang menangani izin — tidak perlu request manual
      print('Location permission handled by browser');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final myWidget = (myPosition == 'Getting location...')
        ? const CircularProgressIndicator()
        : Text(myPosition, textAlign: TextAlign.center);

    return Scaffold(
      appBar: AppBar(title: const Text('Current Location - Diana')),
      body: Center(child: myWidget),
    );
  }
}
