import 'dart:async';

import 'package:alquran_app/model/modelsurah.dart';
import 'package:alquran_app/model/modelsurat.dart';
import 'apiprovider.dart';

class Repository {
  final apiProvider = ApiProvider();

  //untuk ambil data Role Peran
  Future <Modelsurat> fetchAllSurah() => apiProvider.fetchSurat();
}