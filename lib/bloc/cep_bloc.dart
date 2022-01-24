import 'package:bloc/bloc.dart';
import 'package:example_bloc_cep/bloc/bloc.dart';
import 'package:example_bloc_cep/model/model.dart';
import 'package:example_bloc_cep/service/cep_service.dart';

class CepBloc extends Bloc<CepEvent, CepState> {

  CepService _cepService;

  CepBloc(this._cepService) : super(CepInitState());

  @override
  Stream<CepState> mapEventToState(CepEvent event) async* {

    if(event is ResetCepEvent) {
      print('Entrou mapEventToState ResetCep');
      yield CepInitState();
    } else if(event is FetchCepEvent) {

      yield CepLoadingState();

      print('Cep recebido -> ${event.props}');
      Cep cep = await _cepService.getCep(event.props[0].toString());

      if(cep != null) {
        yield CepLoadedState(cep);
      } else {
        CepNotFoundState();
        throw Exception();
      }
    }

  }
}