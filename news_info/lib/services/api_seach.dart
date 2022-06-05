import 'base_network_cari.dart';

class BeritaDataSource {
  static BeritaDataSource instance = BeritaDataSource();
  static Future<Map<String, dynamic>> loadCountries(String partUrl) async {
    return BaseNetwork.get(partUrl);
  }
}
