import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:surah_munjiat_v2/Service/waktu_solat_service.dart';

class WaktuSolatController extends GetxController {
  bool stateLoading = true;
  bool zoneLoading = true;
  bool waktuSolatLoading = false;

  late Future<List> state;
  String? selectedState;
  Future<List>? zone;
  String? selectedZone;
  Future<List>? waktuSolat;

  @override
  void onInit() {
    super.onInit();
    state = WaktuSolatService().getState().whenComplete(() {
      stateLoading = false;
    });
  }
}
