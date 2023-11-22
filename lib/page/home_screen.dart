import 'package:flutter/material.dart';
import 'package:shop_inventory_mobile/page/add_item.dart';
import 'package:shop_inventory_mobile/page/item_list.dart';
import 'package:shop_inventory_mobile/widget/drawer.dart';
import '../widget/bottom_sheet.dart';
import '../widget/button_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Inventory'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                color: Colors.blueAccent,
                height: MediaQuery.sizeOf(context).height * (1 / 3),
                width: double.maxFinite,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Hello!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
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
                        Navigator.pushNamed(context, AddItemScreen.routeName);
                      },
                    ),
                    ButtonCard(
                      icon: Icons.list,
                      name: 'Item List',
                      onTap: () {
                        Navigator.pushNamed(context, ItemList.routeName);
                      },
                    ),
                    ButtonCard(
                      icon: Icons.more_horiz_rounded,
                      name: 'More',
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const HomeBottomSheet();
                            });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
