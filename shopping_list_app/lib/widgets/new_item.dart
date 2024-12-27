import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/httpRequests/grocery_item_services.dart';
import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

import 'package:http/http.dart' as http;

class NewItemWidget extends StatefulWidget {
  const NewItemWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _maxLenght = 50;
  final _minLenght = 1;

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  String get initialQuantity {
    return _enteredQuantity.toString();
  }

  void _saveitem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final item = GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory);

      await GroceryItemServices.postGroceryItem(item);
      if (!context.mounted) {
        return;
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  String? _validateMinimalLenght(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= _minLenght ||
        value.trim().length > _maxLenght) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? _validateQuantity(String? value) {
    if (value == null ||
        value.isEmpty ||
        int.tryParse(value) == null ||
        int.tryParse(value)! <= 0) {
      return 'Must be a positive number';
    }
    return null;
  }

  void _saveEnteredName(newValue) {
    _enteredName = newValue!;
  }

  void _setEnteredQuantity(newValue) {
    _enteredQuantity = int.tryParse(newValue!)!;
  }

  void _saveCategory(newValue) {
    setState(() {
      _selectedCategory = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: _maxLenght,
                    decoration: const InputDecoration(label: Text('Name')),
                    validator: _validateMinimalLenght,
                    onSaved: _saveEnteredName,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration:
                              const InputDecoration(label: Text('Quantity')),
                          initialValue: initialQuantity,
                          validator: _validateQuantity,
                          onSaved: _setEnteredQuantity,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField(
                            value: _selectedCategory,
                            items: [
                              for (final category in categories.entries)
                                DropdownMenuItem(
                                    value: category.value,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          color: category.value.color,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(category.value.title)
                                      ],
                                    ))
                            ],
                            onChanged: _saveCategory),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: _resetForm, child: const Text('Reset')),
                      ElevatedButton(
                          onPressed: _saveitem, child: const Text('Add Item'))
                    ],
                  )
                ],
              ))),
    );
  }
}
