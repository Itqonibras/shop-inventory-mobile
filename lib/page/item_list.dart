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
          Expanded(
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
                Consumer<ItemProvider>(
                  builder: (context, state, _) {
                    if (state.state == ResultState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.state == ResultState.noData) {
                      return const Center(child: Text('Empty'));
                    } else {
                      return Column(
                        children: [
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(top: 0),
                              shrinkWrap: true,
                              itemCount: state.result.length,
                              itemBuilder: (context, index) {
                                var item = state.result[index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                                  child: ItemCard(
                                    name: item.fields.name,
                                    description: item.fields.description,
                                    amount: item.fields.amount.toString(),
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
