import 'package:flutter/material.dart';

class DetailScreenArguments {
  final String name;
  final String description;
  final String amount;

  DetailScreenArguments(this.name, this.description, this.amount);
}

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  final String name;
  final String description;
  final String amount;

  const DetailScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Detail'),
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blueAccent,
          ),
          Stack(
            children: [
              Container(
                height: 50,
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Item Name',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(),
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Amount',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(),
                    Text(
                      amount,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(),
                    Text(
                      description,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
