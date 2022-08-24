import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/widgets/device_detail_text_widget.dart';

import '../../../../../Dominio/models/device_model.dart';

class DeviceDetailPage extends StatefulWidget {
  DeviceModel deviceModel;

  DeviceDetailPage({
    required this.deviceModel,
  });

  @override
  State<DeviceDetailPage> createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.deviceModel.deviceName,
                  style: TextStyle(
                    color: kBrandSecondaryFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                widget.deviceModel.status
                    ? Container(
                        height: height * 0.3,
                        width: width * 0.7,
                        decoration: const BoxDecoration(
                          color: kBrandSecondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/light_bulb_turn_on.png',
                          scale: 2.9,
                        ),
                      )
                    : Container(
                        height: height * 0.3,
                        width: width * 0.7,
                        decoration: const BoxDecoration(
                          color: kBrandPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/light_bulb_turn_off.png',
                          scale: 2.9,
                        ),
                      ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.deviceModel.status ? "Apagar" : "Encender",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandSecondaryFontColor,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DeviceDetailTextWidget(
                  title: "Estado actual",
                  data: widget.deviceModel.status ? "encendido" : "apagado",
                ),
                DeviceDetailTextWidget(
                  title: "Ubicación",
                  data: "${widget.deviceModel.piso.toString()}º piso",
                ),
                DeviceDetailTextWidget(
                  title: "Tiempo encendido",
                  data: "${widget.deviceModel.hours.toString()} h",
                ),
                DeviceDetailTextWidget(
                  title: "Consumo de energía",
                  data: "${widget.deviceModel.watts.toString()} kw hora",
                ),
                DeviceDetailTextWidget(
                  title: "Consumo de energía acumulado",
                  data: "${widget.deviceModel.watts.toString()} kw",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
