import 'package:favorite_place/models/place_item.dart';
import 'package:favorite_place/screens/new_place.dart';
import 'package:favorite_place/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({super.key});

  @override
  State<PlaceListScreen> createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  final List<PlaceItem> _placeItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewPlaceScreen(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _placeItems.add(newItem);
    });
  }

  void moveToDetailScreen(PlaceItem item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PlaceDetailScreen(
          item: item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_placeItems.isEmpty) {
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
        itemCount: _placeItems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              moveToDetailScreen(_placeItems[index]);
            },
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  _placeItems[index].name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.amber),
                ),
              ),
            ),
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
        body: content);
  }
}
