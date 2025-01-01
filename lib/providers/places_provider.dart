import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_place/models/place_item.dart';

class PlacesProvider extends StateNotifier<List<PlaceItem>> {
  PlacesProvider() : super([]);
}
