import 'package:flutter/foundation.dart';
import 'package:shop_inventory_mobile/data/api_service.dart';

enum ResultState { loading, noData, hasData }

class ItemProvider extends ChangeNotifier {
  final ApiService apiService;

  ItemProvider({required this.apiService}) {
    fetchItem();
  }

  late ResultState _state;
  ResultState get state => _state;

  late dynamic _itemResult;

  dynamic get result => _itemResult;

  Future<void> fetchItem() async {
    _state = ResultState.loading;
    List listItem = await apiService.getItem();
    if (listItem.isEmpty) {
      _state = ResultState.noData;
      notifyListeners();
    } else {
      _state = ResultState.hasData;
      _itemResult = listItem;
      notifyListeners();
    }
  }
}
