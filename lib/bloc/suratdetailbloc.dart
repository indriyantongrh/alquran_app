import 'package:alquran_app/model/suratdetailmodel.dart';
import 'package:alquran_app/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class suratDetailBloc{
  final _repository = Repository();
  final _DetailObject = PublishSubject<List<Detailsuratmodel>>();

  Observable<List<Detailsuratmodel>> get DetailSuratObject => _DetailObject.stream;
  fetchDetailSurat() async {
    List<Detailsuratmodel> DetailSurat = await _repository.fetctSuratDetail();
    _DetailObject.sink.add(DetailSurat);
  }
  dispose(){
    _DetailObject.close();
  }
}

final bloc = suratDetailBloc();