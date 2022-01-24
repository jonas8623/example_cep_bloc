
import 'package:equatable/equatable.dart';
import 'package:example_bloc_cep/model/model.dart';

class CepState extends Equatable {

  @override
  List<Object> get props => [];

}

// Analisar tudo que tem de estado no app

class CepInitState extends CepState {}
class CepLoadingState extends CepState {}
class CepNotFoundState extends CepState {}

class CepLoadedState extends CepState {

  final _cep;

  CepLoadedState(this._cep);

  Cep get getCep => _cep;

  @override
  List<Object> get props => [_cep];
}


