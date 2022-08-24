import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/home/device/device_add_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../shared/constants/color.dart';
import '../device/device_register_page.dart';

class ScanerQRPage extends StatefulWidget {
  const ScanerQRPage({Key? key}) : super(key: key);

  @override
  State<ScanerQRPage> createState() => _ScanerQRPageState();
}

class _ScanerQRPageState extends State<ScanerQRPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool _deviceDetected = false;
  String _deviceData = "";
  String _displayMessage = "";

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 260.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: kBrandPrimaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 7,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null) {
          _deviceData = result!.code!;
          List validar = _deviceData.split("_");
          if(validar[0] == "pe*L5DO09"){
            _deviceDetected = true;
            _displayMessage = "dispositivo detectado";
          }else{
            _deviceDetected = false;
            _displayMessage = "Porfavor escanee el codigo QR del dispositivo";
          }
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no tiene permniso')),
      );
    }
  }

  //Se usa para liberar recursos al eliminar la pagina (por los controladores)
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: kBrandPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Información del dispositivo: ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    _deviceDetected ? _displayMessage : "Porfavor escanee el codigo QR del dispositivo",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kBrandSecondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      onPressed: _deviceDetected
                          ? () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeviceRegisterPage(),
                          ),
                        );
                      }
                          : null,
                      child: Text(
                        "Guardar dispositivo",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: _deviceDetected
                              ? Colors.white : Colors.white.withOpacity(0.45),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
