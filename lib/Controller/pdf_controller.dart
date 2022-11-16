// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path_provider/path_provider.dart';

class PdfController extends GetxController {
  String? pdfPath;
  String fatihah = "";
  String kahfi = "";
  String sajdah = "";
  String yaasin = "";
  String dukhaan = "";
  String rahman = "";
  String waqiah = "";
  String mulk = "";
  String hasyr = "";
  String doa_mathurat = "";
  String zikir_mathurat = "";
  String ayatSatu = "";
  String ayatLima = "";
  String ayatTujuh = "";
  String ayatLimaBelas = "";
  String ayatTigaPuluhTiga = "";
  String ayatShifa = "";
  String ayatHafizh = "";
  String doa_solat_1 = "";
  String doa_solat_2 = "";
  String doa_solat_3 = "";
  String doa_solat_4 = "";
  String doa_solat_5 = "";
  String doa_solat_6 = "";
  String doa_solat_7 = "";
  String doa_solat_8 = "";
  String doa_solat_9 = "";
  String solat_dhuha = "";
  String solat_hajat = "";
  String solat_istikarah = "";
  String solat_tahajjut = "";
  String solat_taubat = "";
  String solat_terawih = "";
  String doa_yaasin = "";
  String wirid_solat = "";
  String doa_hadis_1 = "";
   String doa_hadis_2 = "";
    String doa_hadis_3 = "";

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  void onInit() {
    fromAsset('assets/Surah/Surah_Al-Fatihah.pdf', 'Surah_Al-Fatihah.pdf')
        .then((f) {
      fatihah = f.path;
    });
    fromAsset('assets/Surah/Surah_Al-Kahfi.pdf', 'Surah_Al-Kahfi.pdf')
        .then((f) {
      kahfi = f.path;
    });
    fromAsset('assets/Surah/Surah_As-Sajdah.pdf', 'Surah_As-Sajdah.pdf')
        .then((f) {
      sajdah = f.path;
    });
    fromAsset('assets/Surah/Surah_Yaasin.pdf', 'Surah_Yaasin.pdf').then((f) {
      yaasin = f.path;
    });
    fromAsset('assets/Surah/Surah_Al-Dukhaan.pdf', 'Surah_Al-Dukhaan.pdf')
        .then((f) {
      dukhaan = f.path;
    });
    fromAsset('assets/Surah/Surah_Ar-Rahman.pdf', 'Surah_Ar-Rahman.pdf')
        .then((f) {
      rahman = f.path;
    });
    fromAsset('assets/Surah/Surah_Al-Waqiah.pdf', 'Surah_Al-Waqiah.pdf')
        .then((f) {
      waqiah = f.path;
    });
    fromAsset('assets/Surah/Surah_Al-Mulk.pdf', 'Surah_Al-Mulk.pdf').then((f) {
      mulk = f.path;
    });
    fromAsset('assets/Surah/Surah_Al-Hasyr.pdf', 'Surah_Al-Hasyr.pdf')
        .then((f) {
      hasyr = f.path;
    });
    fromAsset('assets/Zikir_Al_Mathurat.pdf', 'Zikir_Al_Mathurat.pdf')
        .then((f) {
      zikir_mathurat = f.path;
    });
    fromAsset('assets/Doa_Al_Mathurat.pdf', 'Doa_Al_Mathurat.pdf').then((f) {
      doa_mathurat = f.path;
    });

    fromAsset('assets/Ayat_Munjiat/ayat_satu.pdf', 'ayat_satu.pdf').then((f) {
      ayatSatu = f.path;
    });
    fromAsset('assets/Ayat_Munjiat/ayat_lima.pdf', 'ayat_lima.pdf').then((f) {
      ayatLima = f.path;
    });
    fromAsset('assets/Ayat_Munjiat/ayat_tujuh.pdf', 'ayat_tujuh.pdf').then((f) {
      ayatTujuh = f.path;
    });
    fromAsset('assets/Ayat_Munjiat/ayat_limabelas.pdf', 'ayat_limabelas.pdf')
        .then((f) {
      ayatLimaBelas = f.path;
    });
    fromAsset('assets/Ayat_Munjiat/ayat_tigapuluhtiga.pdf',
            'ayat_tigapuluhtiga.pdf')
        .then((f) {
      ayatTigaPuluhTiga = f.path;
    });
    fromAsset('assets/Ayat_Munjiat/ayat_shifa.pdf', 'ayat_shifa.pdf').then((f) {
      ayatShifa = f.path;
    });
    fromAsset('assets/Ayat_Munjiat/ayat_hifizh.pdf', 'ayat_hifizh.pdf')
        .then((f) {
      ayatHafizh = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_1.pdf', 'doa_solat_1.pdf')
        .then((f) {
      doa_solat_1 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_2.pdf', 'doa_solat_2.pdf')
        .then((f) {
      doa_solat_2 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_3.pdf', 'doa_solat_3.pdf')
        .then((f) {
      doa_solat_3 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_4.pdf', 'doa_solat_4.pdf')
        .then((f) {
      doa_solat_4 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_5.pdf', 'doa_solat_5.pdf')
        .then((f) {
      doa_solat_5 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_6.pdf', 'doa_solat_6.pdf')
        .then((f) {
      doa_solat_6 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_7.pdf', 'doa_solat_7.pdf')
        .then((f) {
      doa_solat_7 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_8.pdf', 'doa_solat_8.pdf')
        .then((f) {
      doa_solat_8 = f.path;
    });
    fromAsset('assets/Doa_Selepas_Solat/doa_solat_9.pdf', 'doa_solat_9.pdf')
        .then((f) {
      doa_solat_9 = f.path;
    });
    fromAsset('assets/Doa/doa_dhuha.pdf', 'doa_dhuha.pdf').then((f) {
      solat_dhuha = f.path;
    });
    fromAsset('assets/Doa/doa_hajat.pdf', 'doa_hajat.pdf').then((f) {
      solat_hajat = f.path;
    });
    fromAsset('assets/Doa/doa_istikharah.pdf', 'doa_istikarah.pdf').then((f) {
      solat_istikarah = f.path;
    });
    fromAsset('assets/Doa/doa_tahajjud.pdf', 'doa_tahajjud.pdf').then((f) {
      solat_tahajjut = f.path;
    });
    fromAsset('assets/Doa/doa_taubat.pdf', 'doa_taubat.pdf').then((f) {
      solat_taubat = f.path;
    });
    fromAsset('assets/Doa/doa_terawih.pdf', 'doa_terawih.pdf').then((f) {
      solat_terawih = f.path;
    });
    fromAsset('assets/Doa/doa_yaasin.pdf', 'doa_yaasin.pdf').then((f) {
      doa_yaasin = f.path;
    });
    fromAsset('assets/Wirid/wirid.pdf', 'wirid.pdf').then((f) {
      wirid_solat = f.path;
    });
     fromAsset('assets/Doa_Pendek_Drpd_Hadis/doa_pendek_hadis_2.pdf', 'doa_pendek_hadis_2.pdf').then((f) {
      doa_hadis_1 = f.path;
    });
     fromAsset('assets/Doa_Pendek_Drpd_Hadis/doa_pendek_hadis_3.pdf', 'doa_pendek_hadis_3.pdf').then((f) {
      doa_hadis_2 = f.path;
    });
     fromAsset('assets/Doa_Pendek_Drpd_Hadis/doa_pendek_hadis_4.pdf', 'doa_pendek_hadis_4.pdf').then((f) {
      doa_hadis_3 = f.path;
    });

    super.onInit();
  }
}
