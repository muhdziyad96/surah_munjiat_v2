import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Doa/solat_fardhu_page.dart';

class SolatFardhuScreen extends StatefulWidget {
  const SolatFardhuScreen({super.key});

  @override
  State<SolatFardhuScreen> createState() => _SolatFardhuScreenState();
}

class _SolatFardhuScreenState extends State<SolatFardhuScreen> {
  final pdf = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doa Selepas Solat Fardhu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowBtn(
            children: [
              btn(
                title: 'Doa Selepas \nSolat 1',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 1',
                        path: pdf.doa_solat_1,
                      ));
                },
              ),
              btn(
                title: 'Doa Selepas \nSolat 2',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat ',
                        path: pdf.doa_solat_2,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Doa Selepas \nSolat 3',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 3',
                        path: pdf.doa_solat_3,
                      ));
                },
              ),
              btn(
                title: 'Doa Selepas \nSolat 4',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 4',
                        path: pdf.doa_solat_4,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Doa Selepas \nSolat 5',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 5',
                        path: pdf.doa_solat_5,
                      ));
                },
              ),
              btn(
                title: 'Doa Selepas \nSolat 6',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 6',
                        path: pdf.doa_solat_6,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Doa Selepas \nSolat 7',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 7',
                        path: pdf.doa_solat_7,
                      ));
                },
              ),
              btn(
                title: 'Doa Selepas \nSolat 8',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 8',
                        path: pdf.doa_solat_8,
                      ));
                },
              ),
            ],
          ),
          rowBtn(
            children: [
              btn(
                title: 'Doa Selepas \nSolat 9',
                onPressed: () {
                  Get.to(() => SolatFardhuPage(
                        title: 'Doa Selepas Solat 9',
                        path: pdf.doa_solat_9,
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
