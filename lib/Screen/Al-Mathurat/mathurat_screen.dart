import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Constant/color.dart';
import 'package:surah_munjiat_v2/Constant/fadhilat.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Al-Mathurat/mathurat_page.dart';

class MathuratScreen extends StatefulWidget {
  const MathuratScreen({super.key});

  @override
  State<MathuratScreen> createState() => _MathuratScreenState();
}

class _MathuratScreenState extends State<MathuratScreen> {
  final pdf = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Mathurat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Card(
              margin: EdgeInsets.all(2.1.w),
              color: secondaryColor,
              child: Container(
                padding: EdgeInsets.all(2.1.w),
                child: ListView(
                  children: <Widget>[
                    const Text(
                      'Fadhilat Al-Muthurat',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(al_mathurat, textAlign: TextAlign.center)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: rowBtn(
              children: [
                btn(
                  title: 'Zikir Al-Mathurat',
                  onPressed: () {
                    Get.to(() => MathuratPage(
                          title: 'Zikir Al-Mathurat',
                          path: pdf.zikir_mathurat,
                          subText: fatihah,
                        ));
                  },
                ),
                btn(
                  title: 'Doa Al-Mathurat',
                  onPressed: () {
                    Get.to(() => MathuratPage(
                          title: 'Doa Al-Mathurat',
                          path: pdf.doa_mathurat,
                          subText: kahfi,
                        ));
                  },
                ),
              ],
            ),
          ),
          // rowBtn(
          //   children: [
          //     btn(
          //       title: 'Surah Al-Fatihah',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Al-Fatihah',
          //               path: pdf.fatihah,
          //               text: 'Daripada',
          //               subText: fatihah,
          //             ));
          //       },
          //     ),
          //     btn(
          //       title: 'Surah Al-Kahfi',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Al-Kahfi',
          //               path: pdf.kahfi,
          //               text: 'Daripada',
          //               subText: kahfi,
          //             ));
          //       },
          //     ),
          //   ],
          // ),
          // rowBtn(
          //   children: [
          //     btn(
          //       title: 'Surah As-Sajdah',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah As-Sajdah',
          //               path: pdf.sajdah,
          //               text: 'Daripada',
          //               subText: sajdah,
          //             ));
          //       },
          //     ),
          //     btn(
          //       title: 'Surah Yaasin',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Yaasin',
          //               path: pdf.yaasin,
          //               text: 'Daripada',
          //               subText: yaasin,
          //             ));
          //       },
          //     ),
          //   ],
          // ),
          // rowBtn(
          //   children: [
          //     btn(
          //       title: 'Surah Al-Dukhaan',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Al-Dukhaan',
          //               path: pdf.fatihah,
          //               text: 'Daripada',
          //               subText: fatihah,
          //             ));
          //       },
          //     ),
          //     btn(
          //       title: 'Surah Ar-Rahman',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Ar-Rahman',
          //               path: pdf.kahfi,
          //               text: 'Daripada',
          //               subText: kahfi,
          //             ));
          //       },
          //     ),
          //   ],
          // ),
          // rowBtn(
          //   children: [
          //     btn(
          //       title: 'Surah Al-Waqiah',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Al-Waqiah',
          //               path: pdf.waqiah,
          //               text: 'Daripada',
          //               subText: waqiah,
          //             ));
          //       },
          //     ),
          //     btn(
          //       title: 'Surah Al-Mulk',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Al-Mulk',
          //               path: pdf.mulk,
          //               text: 'Daripada',
          //               subText: mulk,
          //             ));
          //       },
          //     ),
          //   ],
          // ),
          // rowBtn(
          //   children: [
          //     btn(
          //       title: 'Surah Al-Hasyr',
          //       onPressed: () {
          //         Get.to(() => SurahPage(
          //               title: 'Surah Al-Hasyr',
          //               path: pdf.hasyr,
          //               text: 'Daripada',
          //               subText: hasyr,
          //             ));
          //       },
          //     ),
          //   ],
          // ),
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
