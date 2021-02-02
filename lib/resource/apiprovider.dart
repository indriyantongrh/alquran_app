
import 'dart:convert';

import 'package:alquran_app/model/modelsurat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'package:alquran_app/model/modelsurah.dart';

class ApiProvider {
  Client client = Client();
  String data;
  final _url ="https://api.quran.sutanlab.id/surah";

  Future <Modelsurat> fetchSurat() async{
    print("masuk");
    final response = await client.get(_url);
    // if(response.statusCode  == 200){
    //   return compute(modelsurahFromJson, response.body);
    // }else{
    //   throw Exception('Failed to load');
    // }
    if(response.statusCode==200){
      print("sukses");
      //print(response.body);
      //return compute(modelsuratFromJson(jsonDecode(response.body)));
      return Modelsurat.fromJson(jsonDecode(response.body));
    }else{
      print("gagal");
    }
     data = json.encode(response.body);
     print(Modelsurat.fromJson(jsonDecode(response.body)));

  }



}