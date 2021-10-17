import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: const <Widget>[
          Placeholder(
            fallbackWidth: 100,
            fallbackHeight: 140,
          ),
          Text('The More of Less'),
        ],
      ),
    );
  }
}
