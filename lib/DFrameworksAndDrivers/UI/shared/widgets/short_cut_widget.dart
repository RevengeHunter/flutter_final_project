import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../space_between_widgets/space.dart';

class ShortCutWidget extends StatelessWidget {
  String title;
  String image;

  ShortCutWidget({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: 70,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: kBrandPrimaryColor.withOpacity(0.9),
            radius: 35,
            child: Image.asset('assets/images/$image'),
          ),
          divider3,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kBrandPrimaryColor.withOpacity(0.8),
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
