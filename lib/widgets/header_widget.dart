import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  String city = '';
  String date = DateFormat("yMMMMd").format(DateTime.now());
  @override
  void initState() {
    getadress(globalController.getlatitude().value,
        globalController.getlongitude().value);
    super.initState();
  }

  getadress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
    //print(placemarks);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Text(
              city,
              style: const TextStyle(fontSize: 30, height: 2),
            )),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            alignment: Alignment.topLeft,
            child: Text(
              date,
              style:
                  TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
            ))
      ],
    );
  }
}
