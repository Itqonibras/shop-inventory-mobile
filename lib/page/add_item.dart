import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_inventory_mobile/data/item_model.dart';
import 'package:shop_inventory_mobile/provider/item_provider.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = '/add-item';

  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  late Item newItem;

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Item',
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.blueAccent,
                  height: 100,
                  width: double.maxFinite,
                ),
                Stack(
                  children: [
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      color: Colors.blueAccent,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Container(
                        color: const Color(0xFFF4F4F4),
                        height: 50,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Item Name",
                                  labelText: "Item Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _name = value!;
                                  });
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Item name can't be empty!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Amount",
                                  labelText: "Amount",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _amount = int.parse(value!);
                                  });
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Amount can't be empty!";
                                  }
                                  if (int.tryParse(value) == null) {
                                    return "Amount must be a number!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Description",
                                  labelText: "Description",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _description = value!;
                                  });
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Description can't be empty!";
                                  }
                                  return null;
                                },
                                maxLines: 5,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blueAccent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        newItem = Item(
                                            name: _name,
                                            amount: _amount,
                                            description: _description);
                                        data.addItem(newItem);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return buildAlertDialog(context);
                                          },
                                        );
                                      }
                                    },
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFFFFFF),
      title: const Text(
        'Successfully add item',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            Text(
              _name,
              style: const TextStyle(fontSize: 18),
            ),
            const Text('Amount'),
            Text(
              _amount.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            const Text('Description'),
            Text(
              _description,
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.reset();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
