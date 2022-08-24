import 'package:flutter/material.dart';
import '../space_between_widgets/space.dart';

void showSnackBar(
    BuildContext context, String text, Color color, IconData icons) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: color, //Colors.redAccent,
      content: Row(
        children: [
          Icon(
            icons,
            color: Colors.white,
          ),
          dividerWidth10,
          Text(
            text,
          ),
        ],
      ),
    ),
  );
}
