import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Munjiat/munjiat_page.dart';

class MunjiatScreen extends StatefulWidget {
  const MunjiatScreen({super.key});

  @override
  State<MunjiatScreen> createState() => _MunjiatScreenState();
}

class _MunjiatScreenState extends State<MunjiatScreen> {
  final pdf = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayat Munjiat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowBtn(
            children: [
              btn(
                title: 'Ayat Satu',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Satu',
                        path: pdf.ayatSatu,
                      ));
                },
              ),
              btn(
                title: 'Ayat Lima',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Lima',
                        path: pdf.ayatLima,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Ayat Tujuh',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Tujuh',
                        path: pdf.ayatTujuh,
                      ));
                },
              ),
              btn(
                title: 'Ayat Lima Belas',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Lima Belas',
                        path: pdf.ayatLimaBelas,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Ayat Tiga Puluh Tiga',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Tiga Puluh Tiga',
                        path: pdf.ayatTigaPuluhTiga,
                      ));
                },
              ),
              btn(
                title: 'Ayat Shifa',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Shifa',
                        path: pdf.ayatShifa,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Ayat Hifizh',
                onPressed: () {
                  Get.to(() => MunjiatPage(
                        title: 'Ayat Hifizh',
                        path: pdf.ayatHafizh,
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget btn({String? title, void Function()? onPressed}) {
    return Padding(
      padding: EdgeInsets.all(2.4.w),
      child: ButtonTheme(
        minWidth: 40.w,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.lightBlue,
          // minWidth: 40.w,
          height: 5.h,
          onPressed: onPressed,
          child: Text(title!),
        ),
      ),
    );
  }

  Widget rowBtn({List<Widget> children = const <Widget>[]}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
