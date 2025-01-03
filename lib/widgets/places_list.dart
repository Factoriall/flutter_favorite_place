import 'package:favorite_place/models/place.dart';
import 'package:favorite_place/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (places.isEmpty) {
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
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlaceDetailScreen(
                    item: places[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  places[index].name,
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

    return content;
  }
}
