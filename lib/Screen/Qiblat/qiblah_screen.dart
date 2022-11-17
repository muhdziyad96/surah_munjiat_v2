import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:surah_munjiat_v2/Constant/color.dart';
import 'package:surah_munjiat_v2/Screen/Qiblat/loading_indicator_widget.dart';
import 'package:surah_munjiat_v2/Screen/Qiblat/qiblah_compass.dart';
import 'package:surah_munjiat_v2/Screen/Qiblat/qiblah_maps.dart';

class QiblatScreen extends StatefulWidget {
  const QiblatScreen({super.key});

  @override
  State<QiblatScreen> createState() => _QiblatScreenState();
}

class _QiblatScreenState extends State<QiblatScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: secondaryColor,
          child: const Center(
            child: Icon(Icons.arrow_back_ios_new),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }

            if (snapshot.data!) {
              return QiblahCompass();
            } else {
              return QiblahMaps();
            }
          },
        ),
      ),
    );
  }
}
