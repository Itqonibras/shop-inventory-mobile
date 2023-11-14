import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_inventory_mobile/page/add_item.dart';
import 'package:shop_inventory_mobile/provider/item_provider.dart';

import '../widget/item_card.dart';

class ItemList extends StatelessWidget {
  static const routeName = '/item-list';

  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        scrolledUnderElevation: 0,
      ),
      extendBodyBehindAppBar: true,
      floatingActionButton: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.blueAccent,
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () =>
                  Navigator.pushNamed(context, AddItemScreen.routeName),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: 100,
            width: double.maxFinite,
          ),
          Consumer<ItemProvider>(
            builder: (context, data, _) {
              return Expanded(
                child: Stack(
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
                    data.itemCount() == 0
                        ? const Center(child: Text('Empty'))
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 12),
                            shrinkWrap: true,
                            itemCount: data.itemCount(),
                            itemBuilder: (context, index) {
                              var item = data.itemList[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 6, 12, 6),
                                child: ItemCard(
                                  data: data,
                                  name: item.name,
                                  description: item.description,
                                  amount: item.amount.toString(),
                                  index: index,
                                ),
                              );
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}