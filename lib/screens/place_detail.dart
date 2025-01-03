import 'package:favorite_place/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.item});

  final Place item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Detail"),
      ),
      body: Center(
        child: Text(item.name),
      ),
    );
  }
}
