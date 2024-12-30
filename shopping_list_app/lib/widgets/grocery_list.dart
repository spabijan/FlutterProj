import 'package:flutter/material.dart';
import 'package:shopping_list_app/httpRequests/grocery_item_services.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/widgets/list_item_tile.dart';
import 'package:shopping_list_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(future: _loadedItems, builder: _buildListBody));
  }

  Widget _buildListBody(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _loadingWidget;
    }
    if (snapshot.hasError) {
      return _getloadingError(errorText: snapshot.error.toString());
    }
    if (snapshot.data!.isEmpty) {
      return _fallbackContent;
    }
    return _groceryListContent(snapshot.data!);
  }

  Future<List<GroceryItem>> _loadItems() async {
    final fetchedItems = await GroceryItemServices.getGroceryItems();

    if (fetchedItems.items != null) {
      return fetchedItems.items!;
    }
    return [];
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItemWidget()));

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    if (!await GroceryItemServices.removeGroceryItem(item)) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  Widget get _fallbackContent {
    return const Center(child: Text('No items added yet.'));
  }

  Widget _groceryListContent(List<GroceryItem> groceryItems) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(color: Colors.red),
          onDismissed: (direction) => _removeItem(groceryItems[index]),
          key: ValueKey(groceryItems[index].id),
          child: ListItemTileWidget(groceryItem: groceryItems[index])),
    );
  }

  Widget get _loadingWidget {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getloadingError({required String errorText}) {
    return Center(child: Text(_error!));
  }
}
