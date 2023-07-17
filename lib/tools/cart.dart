import 'package:flutter/material.dart';
import 'package:statemanagement/home.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/tools/items.dart';

class cart with ChangeNotifier {
  List<items> _items = [];
  int _price = 0;

  void add(items itemm) {
    _items.add(itemm);
    _price += itemm.price;
    notifyListeners();
  }

  void remvoe(items itemm) {
    _items.remove(itemm);
    _price -= itemm.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  int get totalprice {
    return _price;
  }

  List<items> get getitems {
    return _items;
  }
}
