import 'package:flutter/material.dart';
import 'package:shop_inventory_mobile/page/detail.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String amount;
  final int index;

  const ItemCard({super.key,
    required this.name,
    required this.description,
    required this.index,
    required this.amount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: DetailScreenArguments(name, description, amount));
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Amount: $amount',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}