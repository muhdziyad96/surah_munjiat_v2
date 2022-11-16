import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Doa/solat_fardhu_page.dart';

class DoaHadisScreen extends StatefulWidget {
  const DoaHadisScreen({super.key});

  @override
  State<DoaHadisScreen> createState() => _DoaHadisScreenState();
}

class _DoaHadisScreenState extends State<DoaHadisScreen> {
  final pdf = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doa Daripada Hadis'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowBtn(
            children: [
              btn(
                title: 'Doa Amalan Harian',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Amalan Harian',
                        path: pdf.doa_hadis_1,
                      ));
                },
              ),
              btn(
                title: 'Doa Perniagaan \ndan Rezeki',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Perniagaan dan Rezeki',
                        path: pdf.doa_hadis_2,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Doa Zikir Membersih Diri',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Zikir Membersih Diri',
                        path: pdf.doa_hadis_3,
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
          height: 5.h,
          onPressed: onPressed,
          child: Text(
            title!,
            textAlign: TextAlign.center,
          ),
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
