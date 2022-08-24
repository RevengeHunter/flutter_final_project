import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../space_between_widgets/space.dart';
import '../usefull_widget/text_widget.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  TextEditingController textEditingController;
  String hintText;
  bool? label;

  TextFieldPasswordWidget({
    required this.textEditingController,
    this.hintText = "Contraseña",
    this.label = false,
  });

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label! ? TextNormal(text: "${widget.hintText}:") : Container(),
        widget.label! ? divider6 : Container(),
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
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
            obscureText: isInvisible,
            controller: widget.textEditingController,
            maxLines: 1,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              hintText: "${widget.hintText}",
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: kBrandPrimaryFontColor.withOpacity(0.8),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.lock,
                color: kBrandSecondaryColor.withOpacity(0.9),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  isInvisible = !isInvisible;
                  setState(() {});
                },
                icon: Icon(
                  isInvisible
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: kBrandSecondaryColor.withOpacity(0.9),
                ),
              ),
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
            validator: (String? value) {
              if (value!.isEmpty) {
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
