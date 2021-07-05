import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? description;

  const ErrorPage({Key? key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(description.toString()),
        ],
      ),
    );
  }
}
