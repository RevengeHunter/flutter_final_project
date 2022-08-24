import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/color.dart';

Widget loadingWidget(){
  return const Center(
    child: SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: kBrandSecondaryColor,
      ),
    ),
  );
}