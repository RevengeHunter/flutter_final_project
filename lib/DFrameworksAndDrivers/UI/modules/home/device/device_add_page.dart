import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/home/qr/scaner_qr_page.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';

import '../../../shared/widgets/information_widget.dart';

class DeviceAddPage extends StatefulWidget {
  const DeviceAddPage({Key? key}) : super(key: key);

  @override
  State<DeviceAddPage> createState() => _DeviceAddPageState();
}

class _DeviceAddPageState extends State<DeviceAddPage> {

  _showInformation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.65),
      builder: (BuildContext context) {
        return InformationWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 45.0,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 18.0),
          child: Column(
            children: [
              const Text(
                "Seleccione cómo desea registrar el dispositivo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBrandSecondaryFontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const ScanerQRPage()));
                },
                child: Container(
                  width: width * 0.95,
                  height: height * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kBrandPrimaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        offset: const Offset(4, 4),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Escanear codigo QR",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: width * 0.80,
                            child: Text(
                              "Ecanee el codigo QR que se encuentra en la caja del Dispositivo",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Image.asset(
                            'assets/images/qr-scan.png',
                            scale: 6,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              GestureDetector(
                onTap: (){
                  _showInformation();
                },
                child: Container(
                  width: width * 0.95,
                  height: height * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kBrandPrimaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        offset: const Offset(4, 4),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Buscar dispositivo",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: width * 0.80,
                            child: Text(
                              "Seleccione el dispositivo manualmente para agregarlo a la lista",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Image.asset(
                            'assets/images/mobile-search.png',
                            scale: 6,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
