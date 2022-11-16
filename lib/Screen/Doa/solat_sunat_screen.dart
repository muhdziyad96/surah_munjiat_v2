import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Constant/fadhilat.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Doa/solat_sunat_page.dart';

class SolatSunatScreen extends StatefulWidget {
  const SolatSunatScreen({super.key});

  @override
  State<SolatSunatScreen> createState() => _SolatSunatScreenState();
}

class _SolatSunatScreenState extends State<SolatSunatScreen> {
  final pdf = Get.put(PdfController());
  String title = 'Doa Solat \n';
  String pageTitle = 'Doa Solat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doa Solat Sunat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowBtn(
            children: [
              btn(
                title: '$title Sunat Dhuha',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                        title: '$pageTitle Sunat Dhuha',
                        path: pdf.solat_dhuha,
                        subText: dhuha,
                      ));
                },
              ),
              btn(
                title: '$title Sunat Hajat',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                        title: '$pageTitle Sunat Hajat',
                        path: pdf.solat_hajat,
                        subText: hajat,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: '$title Sunat Istikarah',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                        title: '$pageTitle Sunat Istikarah',
                        path: pdf.solat_istikarah,
                        subText: istikharah,
                      ));
                },
              ),
              btn(
                title: '$title Sunat Tahajjud',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                        title: '$pageTitle Sunat Tahajjud',
                        path: pdf.solat_tahajjut,
                        subText: tahajjud,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: '$title Sunat Taubat',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                        title: '$pageTitle Sunat Taubat',
                        path: pdf.solat_taubat,
                        subText: taubat,
                      ));
                },
              ),
              btn(
                title: '$title Sunat Terawih',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                        title: '$pageTitle Sunat Terawih',
                        path: pdf.solat_terawih,
                        subText: terawih,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Doa Surah Yaasin',
                onPressed: () {
                  Get.to(() => SolatSunatPage(
                      title: 'Doa Surah Yassin ',
                      path: pdf.doa_yaasin,
                      subText: yaasin));
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
