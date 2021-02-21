import 'dart:async';

import 'package:alquran_app/model/modelsurah.dart';
import 'package:alquran_app/model/modelsurat.dart';
import 'package:alquran_app/model/suratdetailmodel.dart';
import 'package:alquran_app/model/suratmodel.dart';

import 'package:alquran_app/resource/apiprovider.dart';
class Repository {
  final apiProvider = ApiProvider();

  //untuk ambil data Role Peran
  Future <Modelsurat> fetchAllSurah() => apiProvider.fetchSurat();

  //untuk ambil data Role Peran
  Future <List<Suratmodel>> fetctSuratList() => apiProvider.fetchSuratList();

  //untuk mengambildata detail alquran
  Future <List<Detailsuratmodel>> fetctSuratDetail() => apiProvider.fetchSuratdetail();
}