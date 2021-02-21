import 'dart:async';
import 'package:alquran_app/model/modelsurah.dart';
import 'package:alquran_app/model/modelsurat.dart';
import 'package:alquran_app/model/suratmodel.dart';
import 'package:alquran_app/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class suratBloc{
  final _repository = Repository();
  final _SuratObject = PublishSubject<List<Suratmodel>>();

  Observable<List<Suratmodel>> get listSuratObject => _SuratObject.stream;
  fetchListSurat() async {
    List<Suratmodel> listSurat = await _repository.fetctSuratList();
  _SuratObject.sink.add(listSurat);
  }
  dispose(){
    _SuratObject.close();
  }
}

final bloc = suratBloc();