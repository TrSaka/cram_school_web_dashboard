import 'package:flutter/material.dart';

class CustomCircular extends StatelessWidget {
  const CustomCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
