import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/home/device/device_detail_page.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';

import '../../../../Dominio/models/device_model.dart';
import '../space_between_widgets/space.dart';
import 'delete_confirmation_widget.dart';

class CardDeviceWidget extends StatefulWidget {
  DeviceModel deviceModel;

  CardDeviceWidget({
    required this.deviceModel,
  });

  @override
  State<CardDeviceWidget> createState() => _CardDeviceWidgetState();
}

class _CardDeviceWidgetState extends State<CardDeviceWidget> {
  _showDeleteConfirmation(String idObject, String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.65),
      builder: (BuildContext context) {
        return DeleteConfirmationWidget(
          idObject: idObject,
          title: title,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DeviceDetailPage(
              deviceModel: widget.deviceModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15.0, bottom: 14.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        height: 180.0,
        width: 180.0,
        decoration: BoxDecoration(
          color: kBrandPrimaryColor.withOpacity(0.90),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.deviceModel.status
                      ? 'assets/images/light_bulb_turn_on.png'
                      : 'assets/images/light_bulb_turn_off.png',
                  width: 80.0,
                  height: 100.0,
                ),
                IconButton(
                  onPressed: () {
                    _showDeleteConfirmation(widget.deviceModel.id ?? "",
                        widget.deviceModel.deviceName);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 50.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            divider6,
            Text(
              widget.deviceModel.deviceName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            divider12,
            Text(
              widget.deviceModel.status ? "Encendido" : "Apagado",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
