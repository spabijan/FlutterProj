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
  List<GroceryItem> _groceryItems = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: _body,
    );
  }

  bool get _hasGroceryItems {
    return _groceryItems.isNotEmpty;
  }

  void _loadItems() async {
    final fetchedItems = await GroceryItemServices.getGroceryItems();
    setState(() {
      _groceryItems = fetchedItems;
    });
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItemWidget()));
    _loadItems();
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  Widget get _fallbackContent {
    return const Center(child: Text('No items added yet.'));
  }

  Widget get _groceryListContent {
    return ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(color: Colors.red),
          onDismissed: (direction) => _removeItem(_groceryItems[index]),
          key: ValueKey(_groceryItems[index].id),
          child: ListItemTileWidget(groceryItem: _groceryItems[index])),
    );
  }

  Widget get _body {
    return _hasGroceryItems ? _groceryListContent : _fallbackContent;
  }
}
