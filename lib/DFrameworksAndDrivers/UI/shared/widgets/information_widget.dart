import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/space_between_widgets/space.dart';

import '../constants/color.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({Key? key}) : super(key: key);

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 10.0,
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Funcionalidad no disponible",
              style: TextStyle(
                color: kBrandPrimaryFontColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            divider12,
            Container(
              width: double.infinity,
              height: 70.0,
              child: Text(
                "Muy pronto estara disponible dicha funcionalidad. Disculpe por las molestias.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kBrandSecondaryFontColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            divider6,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kBrandPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(120, 35,),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Volver",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
