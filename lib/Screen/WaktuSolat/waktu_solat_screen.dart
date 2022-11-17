import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Controller/waktu_solat_controller.dart';
import 'package:surah_munjiat_v2/Service/waktu_solat_service.dart';
import 'package:surah_munjiat_v2/Widget/dropdown.dart';

class WaktuSolatScreen extends StatefulWidget {
  const WaktuSolatScreen({super.key});

  @override
  State<WaktuSolatScreen> createState() => _WaktuSolatScreenState();
}

class _WaktuSolatScreenState extends State<WaktuSolatScreen> {
  WaktuSolatController wtc = Get.put(WaktuSolatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waktu Solat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List>(
              future: wtc.state,
              builder: (context, snapshot) {
                return DropDown(
                  title: wtc.stateLoading ? 'Loading...' : 'Negeri',
                  value: wtc.selectedState,
                  onChanged: (v) {
                    setState(() {
                      wtc.selectedState = v;
                      wtc.selectedZone = null;
                      wtc.waktuSolat = null;
                      wtc.zone = WaktuSolatService()
                          .getZone(state: v.toString())
                          .whenComplete(() {
                        wtc.zoneLoading = false;
                      });
                    });
                  },
                  items: snapshot.data?.map(
                    (item) {
                      return DropdownMenuItem(
                        value: item.toString(),
                        child: Text(item.toString().toUpperCase()),
                      );
                    },
                  ).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a state';
                    }
                    return null;
                  },
                );
              },
            ),
            SizedBox(height: 4.2.w),
            FutureBuilder<List>(
              future: wtc.zone,
              builder: (context, snapshot) {
                return DropDown(
                  title: wtc.zone == null
                      ? 'Sila Pilih Negeri'
                      : wtc.zoneLoading
                          ? 'Loading...'
                          : 'Zon',
                  value: wtc.selectedZone,
                  onChanged: (v) {
                    setState(() {
                      wtc.selectedZone = v;
                      wtc.waktuSolatLoading = true;
                      wtc.waktuSolat = WaktuSolatService()
                          .getWaktuSolat(zone: v.toString())
                          .whenComplete(() {
                        wtc.waktuSolatLoading = false;
                      });
                    });
                  },
                  items: snapshot.data?.map(
                    (item) {
                      return DropdownMenuItem(
                        value: item.toString(),
                        child: Text(item.toString().toUpperCase()),
                      );
                    },
                  ).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a zone';
                    }
                    return null;
                  },
                );
              },
            ),
            SizedBox(height: 4.2.w),
            waktuSolatWidget(),
          ],
        ),
      ),
    );
  }

  Widget waktuSolatWidget() {
    return FutureBuilder<List>(
        future: wtc.waktuSolat,
        builder: (context, snapshot) {
          if (!snapshot.hasData || wtc.waktuSolat == null) {
            return Center(
              child: Text(
                  wtc.waktuSolatLoading ? 'Loading...' : 'Sila Pilih Kawasan'),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(4.2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconBuilder(snapshot.data![index].name.toString()),
                          SizedBox(width: 2.1.w),
                          Text(snapshot.data![index].name
                              .toString()
                              .toUpperCase()),
                        ],
                      ),
                      Text(snapshot.data![index].time),
                    ],
                  ),
                );
              },
            );
          }
        });
  }

  iconBuilder(String name) {
    switch (name) {
      case 'imsak':
        return const Icon(Icons.access_time_filled);
      case 'subuh':
        return const Icon(Icons.night_shelter_sharp);
      case 'syuruk':
        return const Icon(Icons.sunny_snowing);
      case 'zohor':
      case 'asar':
        return const Icon(Icons.sunny);
      case 'maghrib':
        return const Icon(Icons.nights_stay);
      case 'isyak':
        return const Icon(Icons.nightlight);
    }
  }
}
