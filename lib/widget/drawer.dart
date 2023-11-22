import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:shop_inventory_mobile/page/add_item.dart';
import 'package:shop_inventory_mobile/page/item_list.dart';
import 'package:shop_inventory_mobile/page/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      backgroundColor: const Color(0xFFF4F4F4),
      width: MediaQuery.of(context).size.width * (2 / 3),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            color: Colors.blueAccent,
            alignment: Alignment.bottomLeft,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Item'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AddItemScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Item List'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ItemList.routeName);
            },
          ),
          const Spacer(),
          ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Log out'),
              iconColor: Colors.redAccent,
              textColor: Colors.redAccent,
              onTap: () async {
                final response = await request.logout(
                    "http://10.0.2.2:8000/mobile/logout/");
                String message = response["message"];
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("$message Sampai jumpa, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message"),
                  ));
                }
              }),
        ],
      ),
    );
  }
}
