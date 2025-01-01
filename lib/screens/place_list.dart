import 'package:favorite_place/models/place_item.dart';
import 'package:favorite_place/screens/new_place.dart';
import 'package:flutter/material.dart';

class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({super.key});

  @override
  State<PlaceListScreen> createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  final List<PlaceItem> placeItems = [];

  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (placeItems.isEmpty) {
      content = const Center(
        child: Text(
          "No data",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30,
          ),
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: placeItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(placeItems[index].name),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Place"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
