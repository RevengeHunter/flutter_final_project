import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';

class DeleteConfirmationWidget extends StatefulWidget {
  String idObject;
  String title;

  DeleteConfirmationWidget({
    required this.idObject,
    required this.title,
  });

  @override
  State<DeleteConfirmationWidget> createState() =>
      _DeleteConfirmationWidgetState();
}

class _DeleteConfirmationWidgetState extends State<DeleteConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 10.0,
      ),
      backgroundColor: kBrandPrimaryColor.withOpacity(0.95),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Eliminar Dispositivo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Container(
              width: 165.0,
              height: 3.0,
              decoration: BoxDecoration(
                color: kBrandSecondaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "Esta seguro que quiere eliminar el dispositivo?",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16.0,
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kBrandSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color(0xff00afb9),
                          duration: const Duration(seconds: 3),
                          content: Row(
                            children: [
                              const Icon(Icons.check),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "El dispositivo fue eliminado correctamente",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
