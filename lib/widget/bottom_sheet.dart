import 'package:flutter/material.dart';
import 'package:shop_inventory_mobile/page/add_item.dart';
import 'package:shop_inventory_mobile/page/item_list.dart';
import 'button_card.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: const Color(0xFFF4F4F4),
        height: MediaQuery.of(context).size.height / 2,
        width: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.grey,
                height: 4,
                width: 50,
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                ButtonCard(
                  icon: Icons.add,
                  name: 'Add Item',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AddItemScreen.routeName);
                  },
                ),
                ButtonCard(
                  icon: Icons.list,
                  name: 'Item List',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ItemList.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}