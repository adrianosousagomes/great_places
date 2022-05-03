import 'package:flutter/foundation.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items]; // return copy of list

  int get itemsCount => _items.length;

  Place getItem(int index) {
    return _items[index];
  }
}
