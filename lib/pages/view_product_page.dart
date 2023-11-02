import 'package:flutter/material.dart';

class ViewProductPage extends StatelessWidget {
  static const String routeName= "/viewproduct";
  const ViewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
    title: const Text('View Product'),),
  body: Center(),
  );
  }
}
