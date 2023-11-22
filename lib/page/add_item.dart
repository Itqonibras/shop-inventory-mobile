import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:shop_inventory_mobile/data/item_model.dart';

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
    final request = context.watch<CookieRequest>();
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final response = await request.postJson(
                                      "http://10.0.2.2:8000/mobile/create-flutter/",
                                      jsonEncode(<String, String>{
                                        'name': _name,
                                        'amount': _amount.toString(),
                                        'description': _description,
                                      }),
                                    );
                                    if (response['status'] == 'success') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Produk baru berhasil disimpan!"),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                              "Terdapat kesalahan, silakan coba lagi."),
                                        ),
                                      );
                                    }
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
  }
}
