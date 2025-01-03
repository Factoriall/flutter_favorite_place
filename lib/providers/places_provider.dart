import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_place/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(name: title);
    state = [newPlace, ...state];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
