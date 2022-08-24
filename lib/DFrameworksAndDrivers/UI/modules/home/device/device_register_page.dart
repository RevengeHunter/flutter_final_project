import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/home/principal_customer_page.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/space_between_widgets/space.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/widgets/text_field_widget.dart';
import 'package:flutter_final_project/Dominio/global_data/sp_global.dart';
import 'package:flutter_final_project/Dominio/models/device_model.dart';
import 'package:flutter_final_project/Dominio/services/device_service.dart';

class DeviceRegisterPage extends StatefulWidget {
  const DeviceRegisterPage({Key? key}) : super(key: key);

  @override
  State<DeviceRegisterPage> createState() => _DeviceRegisterPageState();
}

class _DeviceRegisterPageState extends State<DeviceRegisterPage> {
  final SPGlobal _sp = SPGlobal();
  final DeviceService _deviceService = DeviceService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _txtDeviceName = TextEditingController();
  final TextEditingController _txtDeviceFloor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: kBrandPrimaryFontColor,
        ),
        title: Text(
          "Dispositivo",
          style: TextStyle(
            color: kBrandPrimaryFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    divider30,
                    Text(
                      "Registrar nuevo dispositivo",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: kBrandSecondaryFontColor.withOpacity(0.86),
                      ),
                    ),
                    divider20,
                    TextFieldWidget(
                      textEditingController: _txtDeviceName,
                      hintText: "dispositivo",
                      labelText: "Nombre como reconocerá el dispositivo",
                      validate: true,
                      prefixIcon: Icons.devices_other,
                    ),
                    divider12,
                    TextFieldWidget(
                      textEditingController: _txtDeviceFloor,
                      hintText: "piso",
                      labelText: "En que piso se instalara",
                      validate: true,
                      isNumeric: true,
                      prefixIcon: Icons.add_business_sharp,
                    ),
                    divider6,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 52.0,
              width: double.infinity,
              margin: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanerQRPage()));
                  if (formKey.currentState!.validate()) {
                    DeviceModel deviceModel = DeviceModel(
                      deviceName: _txtDeviceName.text,
                      piso: int.parse(_txtDeviceFloor.text),
                      hours: 0.0,
                      watts: 0.0,
                      userId: _sp.id,
                      status: false,
                    );

                    _deviceService.addDevice(deviceModel).then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrincipalCustomerPage(),
                            ),
                          ),
                        );
                  }
                },
                child: const Text(
                  "Guardar dispositivo",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
