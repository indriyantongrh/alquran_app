import 'dart:async';
import 'package:alquran_app/model/modelsurah.dart';
import 'package:alquran_app/model/modelsurat.dart';
import 'package:alquran_app/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class SurahBloc{
  final _repository = Repository();
  final _getSurah = PublishSubject <Modelsurat>();

  Observable <Modelsurat> get allSurah => _getSurah.stream;
  fetchAllSurah() async {
    Modelsurat surah = await _repository.fetchAllSurah();
    _getSurah.sink.add(surah);
  }
  dispose(){
    _getSurah.close();
  }
}

final bloc = SurahBloc();