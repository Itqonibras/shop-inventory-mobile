import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;

  const CustomCard(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol $title!")));
      },
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: icon,
        ),
      ),
    );
  }
}