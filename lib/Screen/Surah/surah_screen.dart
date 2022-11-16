import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Constant/fadhilat.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Surah/surah_page.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final pdf = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Munjiat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowBtn(
            children: [
              btn(
                title: 'Surah Al-Fatihah',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Al-Fatihah',
                        path: pdf.fatihah,
                        subText: fatihah,
                      ));
                },
              ),
              btn(
                title: 'Surah Al-Kahfi',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Al-Kahfi',
                        path: pdf.kahfi,
                        subText: kahfi,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Surah As-Sajdah',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah As-Sajdah',
                        path: pdf.sajdah,
                        subText: sajdah,
                      ));
                },
              ),
              btn(
                title: 'Surah Yaasin',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Yaasin',
                        path: pdf.yaasin,
                        subText: yaasin,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Surah Al-Dukhaan',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Al-Dukhaan',
                        path: pdf.fatihah,
                        subText: fatihah,
                      ));
                },
              ),
              btn(
                title: 'Surah Ar-Rahman',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Ar-Rahman',
                        path: pdf.kahfi,
                        subText: kahfi,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Surah Al-Waqiah',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Al-Waqiah',
                        path: pdf.waqiah,
                        subText: waqiah,
                      ));
                },
              ),
              btn(
                title: 'Surah Al-Mulk',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Al-Mulk',
                        path: pdf.mulk,
                        subText: mulk,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Surah Al-Hasyr',
                onPressed: () {
                  Get.to(() => SurahPage(
                        title: 'Surah Al-Hasyr',
                        path: pdf.hasyr,
                        subText: hasyr,
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
