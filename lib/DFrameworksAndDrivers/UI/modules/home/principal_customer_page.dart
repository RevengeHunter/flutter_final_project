import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/identity/login/login_page_ui.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/space_between_widgets/space.dart';
import 'package:flutter_final_project/Dominio/global_data/short_cut_global.dart';
import 'package:flutter_final_project/Dominio/models/device_model.dart';
import 'package:flutter_final_project/Dominio/services/device_service.dart';

import '../../../../Dominio/global_data/sp_global.dart';
import '../../shared/widgets/card_device_widget.dart';
import '../../shared/widgets/short_cut_widget.dart';
import 'device/device_add_page.dart';

class PrincipalCustomerPage extends StatefulWidget {
  @override
  State<PrincipalCustomerPage> createState() => _PrincipalCustomerPageState();
}

class _PrincipalCustomerPageState extends State<PrincipalCustomerPage> {
  // Storage
  final SPGlobal _sp = SPGlobal();

  final ShortCutGlobal _shortCutGlobal = ShortCutGlobal();

  final DeviceService _deviceService = DeviceService();
  List<DeviceModel> _deviceModelList = [];

  getDevices() async {
    _deviceModelList = await _deviceService.getDevice();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 18.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lista2.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  _sp.fullName = "";
                  _sp.role = "";
                  _sp.email = "";
                  _sp.isLogin = false;

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPageUI(),
                    ),
                    (route) => false,
                  );
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.output_outlined,
                          color: kBrandPrimaryColor,
                        ),
                        dividerWidth6,
                        Text(
                          "Cerrar sesión",
                          style: TextStyle(
                            color: kBrandPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lista de Dispositivos",
                style: TextStyle(
                  color: kBrandSecondaryFontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              divider12,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: _deviceModelList.isNotEmpty
                      ? _deviceModelList
                          .map(
                            (e) => CardDeviceWidget(
                                deviceModel: e),
                          )
                          .toList()
                      : [],
                ),
              ),
              divider12,
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: kBrandPrimaryColor.withOpacity(0.85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DeviceAddPage()));
                  },
                  icon: Icon(
                    Icons.add,
                    size: 50,
                  ),
                  label: Text(
                    "Agregar dispositivo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              divider40,
              Text(
                "Atajos",
                style: TextStyle(
                  color: kBrandSecondaryFontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              divider12,
              Wrap(
                spacing: 26.5,
                alignment: WrapAlignment.center,
                children: _shortCutGlobal.shortCuts
                    .map(
                      (e) => ShortCutWidget(
                        title: e['title'] ?? "",
                        image: e['image'] ?? "",
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
