import 'package:http/http.dart' as http;
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/utils/constants.dart';
import 'dart:convert';

final class GroceryItemServices {
  GroceryItemServices._();

  static const _groceryListPath = 'shopping-list.json';
  static final _url = Uri.https(Constants.databaseUrl, _groceryListPath);
  static const _nameKey = 'name';
  static const _quantityKey = 'quantity';
  static const _categoryKey = 'category';

  static Future<http.Response> postGroceryItem(GroceryItem item) async {
    final response = await http.post(_url,
        headers: Constants.headers,
        body: json.encode({
          _nameKey: item.name,
          _quantityKey: item.quantity,
          _categoryKey: item.category.title
        }));

    print(response.body);
    print(response.statusCode);
    return response;
  }

  static Future<List<GroceryItem>> getGroceryItems() async {
    final response = await http.get(_url);
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
    return loadedItems;
  }
}
