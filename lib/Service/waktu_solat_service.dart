import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surah_munjiat_v2/Model/state_model.dart';
import 'package:surah_munjiat_v2/Model/waktu_solat_model.dart';
import 'package:surah_munjiat_v2/Model/zone_model.dart';

class WaktuSolatService {
  Future<List> getState() async {
    final response = await http.get(
      Uri.parse('https://waktu-solat-api.herokuapp.com/api/v1/states.json'),
    );
    final responseData = json.decode(response.body);
    State state = State.fromJson(responseData);

    return state.data!.negeri as List;
  }

  Future<List> getZone({required String state}) async {
    final response = await http.get(
      Uri.parse(
          'https://waktu-solat-api.herokuapp.com/api/v1/states.json?negeri=$state'),
    );
    final responseData = json.decode(response.body);
    Zone zone = Zone.fromJson(responseData);

    return zone.data!.negeri!.zon as List;
  }

  Future<List> getWaktuSolat({required String zone}) async {
    final response = await http.get(
      Uri.parse(
          'https://waktu-solat-api.herokuapp.com/api/v1/prayer_times.json?zon=$zone'),
    );
    final responseData = json.decode(response.body);
    WaktuSolat waktuSolat = WaktuSolat.fromJson(responseData);

    return waktuSolat.data![0].waktuSolat as List;
  }
}
