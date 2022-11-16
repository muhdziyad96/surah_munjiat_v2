import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Controller/pdf_controller.dart';
import 'package:surah_munjiat_v2/Screen/Al-Mathurat/mathurat_screen.dart';
import 'package:surah_munjiat_v2/Screen/Doa/doa_hadis_screen.dart';
import 'package:surah_munjiat_v2/Screen/Doa/solat_fardhu_screen.dart';
import 'package:surah_munjiat_v2/Screen/Doa/solat_sunat_screen.dart';
import 'package:surah_munjiat_v2/Screen/Doa/wirid_page.dart';
import 'package:surah_munjiat_v2/Screen/Munjiat/munjiat_screen.dart';
import 'package:surah_munjiat_v2/Screen/Qiblat/qiblah_screen.dart';
import 'package:surah_munjiat_v2/Screen/Surah/surah_screen.dart';
import 'package:surah_munjiat_v2/Screen/Tasbih/tasbih_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();
  final pdf = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.w),
                child: Image.asset('assets/main_icon.png'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      btn(
                        title: 'Surah Munjiat',
                        onPressed: () {
                          Get.to(() => const SurahScreen());
                        },
                      ),
                      btn(
                        title: 'Al-Mathurat',
                        onPressed: () {
                          Get.to(() => const MathuratScreen());
                        },
                      ),
                      btn(
                        title: 'Ayat Munjiat',
                        onPressed: () {
                          Get.to(() => const MunjiatScreen());
                        },
                      ),
                      const Divider(
                        endIndent: 20,
                        indent: 20,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          btn(
                            title: 'Doa Selepas\n Solat Fardhu',
                            onPressed: () {
                              Get.to(() => const SolatFardhuScreen());
                            },
                          ),
                          btn(
                            title: 'Wirid Selepas\n Solat Fardhu',
                            onPressed: () {
                              Get.to(() => WiridPage(
                                    title: 'Wirid Selepas Solat Fardhu',
                                    path: pdf.wirid_solat,
                                  ));
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          btn(
                            title: 'Doa Selepas\n Solat Sunat',
                            onPressed: () {
                              Get.to(() => const SolatSunatScreen());
                            },
                          ),
                          btn(
                            title: 'Doa Daripada\n Hadith-Hadith',
                            onPressed: () {
                              Get.to(() => const DoaHadisScreen());
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        endIndent: 20,
                        indent: 20,
                        color: Colors.grey,
                      ),
                      btn(
                        title: 'Waktu Solat',
                        onPressed: () {},
                      ),
                      btn(
                        title: 'Tasbih',
                        onPressed: () {
                          Get.to(() => const TasbihScreen());
                        },
                      ),
                      btn(
                        title: 'Arah Kiblat',
                        onPressed: () {
                          Get.to(() => const QiblatScreen());
                        },
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btn({String? title, void Function()? onPressed}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.2.w, horizontal: 2.4.w),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.lightBlue,
        minWidth: 40.w,
        height: 5.h,
        onPressed: onPressed,
        child: Text(title!),
      ),
    );
  }
}
