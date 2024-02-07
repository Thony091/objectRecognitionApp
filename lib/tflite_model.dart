import 'package:flutter/material.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({super.key});

  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Classification'),
      ),
    );
  }
}