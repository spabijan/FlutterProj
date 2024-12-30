import 'package:http/http.dart' as http;
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/utils/constants.dart';
import 'dart:convert';

final class FetchGroceryItemsResponse {
  FetchGroceryItemsResponse({this.items, this.errorMessage});
  List<GroceryItem>? items;
  String? errorMessage;
}

final class GroceryItemServices {
  GroceryItemServices._();

  static const _groceryListPath = 'shopping-list';
  static const _jsonShortcut = '.json';
  static final _groceryListUrl =
      Uri.https(Constants.databaseUrl, '$_groceryListPath$_jsonShortcut');
  static const _idKey = 'name';
  static const _nameKey = 'name';
  static const _quantityKey = 'quantity';
  static const _categoryKey = 'category';

  static Future<String> postGroceryItem(GroceryItem item) async {
    final response = await http.post(_groceryListUrl,
        headers: Constants.headers,
        body: json.encode({
          _nameKey: item.name,
          _quantityKey: item.quantity,
          _categoryKey: item.category.title
        }));

    final Map<String, dynamic> savedItem = jsonDecode(response.body);
    return savedItem[_idKey];
  }

  static Future<bool> removeGroceryItem(GroceryItem item) async {
    final deleteUrl = Uri.https(
        Constants.databaseUrl, '$_groceryListPath/${item.id}$_jsonShortcut');
    final response = await http.delete(deleteUrl);
    if (response.statusCode > -400) {
      return false;
    }
    return true;
  }

  static Future<FetchGroceryItemsResponse> getGroceryItems() async {
    http.Response response;

    response = await http.get(_groceryListUrl);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch data. Plase try again later');
    }

    if (response.body == Constants.firebaseNull) {
      return FetchGroceryItemsResponse(items: []);
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catitem) => catitem.value.title == item.value[_categoryKey])
          .value;

      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value[_nameKey],
          quantity: item.value[_quantityKey],
          category: category));
    }

    return FetchGroceryItemsResponse(items: loadedItems);
  }
}
