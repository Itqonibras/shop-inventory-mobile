import 'package:flutter/material.dart';
import 'package:shop_inventory_mobile/common/text_theme.dart';
import 'package:shop_inventory_mobile/page/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Inventory',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: myTextTheme,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}