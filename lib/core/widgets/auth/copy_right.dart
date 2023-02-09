import 'package:flutter/material.dart';

class CopyrightIcon extends StatelessWidget {
  final String text;
  const CopyrightIcon({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
           const Icon(
              Icons.copyright,
              color: Colors.grey,
              size: 24,
            ),
           const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
