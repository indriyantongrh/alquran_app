
import 'dart:convert';

import 'package:alquran_app/model/modelsurat.dart';
import 'package:alquran_app/model/suratdetailmodel.dart';
import 'package:alquran_app/model/suratmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'package:alquran_app/model/modelsurah.dart';

class ApiProvider {
  Client client = Client();
  static String data;
  static String namasurat;
  static String nomorsurat;
  static String arti;
  static String type;
  static String keterangan;
  static String audio;
  static int ayat;
  final _url ="https://api.quran.sutanlab.id/surah";
  final _BaseUrl ="https://api.npoint.io/99c279bb173a6e28359c/";

  Future <Modelsurat> fetchSurat() async{
    print("masuk");
    final response = await client.get(_url);
    if(response.statusCode==200){
      print("sukses");
      print(Modelsurat.fromJson(jsonDecode(response.body)));
      //print(response.body);
      //return compute(modelsuratFromJson(jsonDecode(response.body)));
      return Modelsurat.fromJson(jsonDecode(response.body));
    }else{
      print("gagal");
    }
     ///data = jsonDecode(response.body);
     data = json.encode(response.body);
    print("Print string : ${data}");


  }

  Future <List<Suratmodel>> fetchSuratList() async{
    print("masuk");
    print(_BaseUrl);
    final responsesurat = await client.get(_BaseUrl+"data");
    if(responsesurat.statusCode  == 200){

      return compute(suratmodelFromJson, responsesurat.body);
    }else{
      print("Load gagal");
      print(_BaseUrl);

    }
  }

  Future <List<Detailsuratmodel>> fetchSuratdetail() async{
    print("masuk");
    final responseDetail = await client.get(_BaseUrl+"surat/"+nomorsurat);
    if(responseDetail.statusCode  == 200){
      print(responseDetail.body);
      return compute(detailsuratmodelFromJson, responseDetail.body);
    }else{
      print("Load gagal");

    }

  }

}