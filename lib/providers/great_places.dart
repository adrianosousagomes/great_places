import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            // location: null,
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Place> get items => [..._items]; // return copy of list

  int get itemsCount => _items.length;

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      // location: null,
    );

    _items.add(newPlace);

    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });

    notifyListeners();
  }
}
