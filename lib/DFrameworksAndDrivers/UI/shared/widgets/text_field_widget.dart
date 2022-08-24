import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color.dart';
import '../space_between_widgets/space.dart';
import '../usefull_widget/text_widget.dart';

class TextFieldWidget extends StatelessWidget {

  String labelText;
  String hintText;
  int? maxLines;
  bool? isNumeric;
  TextEditingController textEditingController;
  bool? validate;
  IconData? prefixIcon;

  TextFieldWidget({
    required this.labelText,
    required this.hintText,
    this.maxLines,
    this.isNumeric = false,
    required this.textEditingController,
    this.validate,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNormal(text: labelText),
        divider6,
        Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12.0,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: textEditingController,
            maxLines: maxLines,
            keyboardType:
            isNumeric! ? TextInputType.number : TextInputType.text,
            inputFormatters: isNumeric!
                ? [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ]
                : [],
            style: const TextStyle(
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: kBrandPrimaryFontColor.withOpacity(0.7),
              ),
              filled: true,
              prefixIcon: Icon(prefixIcon,color: kBrandSecondaryColor.withOpacity(0.8),),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (String? value){
              if(value!.isEmpty){
                return "Campo requerido";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
