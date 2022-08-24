import 'package:flutter/material.dart';

import '../constants/color.dart';
class DeviceDetailTextWidget extends StatelessWidget {
  String title;
  String data;
  DeviceDetailTextWidget({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              color: kBrandPrimaryFontColor.withOpacity(0.75),
            ),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: kBrandSecondaryFontColor,
            ),
          ),
        ],
      ),
    );
  }
}
