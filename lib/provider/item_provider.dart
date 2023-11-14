import 'package:flutter/foundation.dart';
import 'package:shop_inventory_mobile/data/item_model.dart';

class ItemProvider extends ChangeNotifier {
  final List<Item> _itemsList = [];

  List<Item> get itemList => _itemsList;

  void addItem(Item item) {
    itemList.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    itemList.removeAt(index);
    notifyListeners();
  }

  itemCount() {
    return itemList.length;
  }

  totalItem() {
    if (itemList.isEmpty) {
      return 0;
    } else {
      int count = 0;
      for (int i = 0; i < itemList.length; i++) {
        count += itemList[i].amount;
      }
      return count;
    }
  }

  lastItem() {
    if (itemList.isNotEmpty) {
      return itemList.last;
    } else {
      return null;
    }
  }
}
