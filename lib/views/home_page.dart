import 'package:example_bloc_cep/bloc/bloc.dart';
import 'package:example_bloc_cep/bloc/cep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _cepController = TextEditingController();

  _form(CepBloc cepBloc, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25.4, right: 25.4),
          child: TextFormField(
            controller: _cepController,
            decoration: InputDecoration(
              labelText: 'Procure o cep',
              hintText: 'Digite o cep',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.4)),
              contentPadding: const EdgeInsets.all(15.4),
              prefixIcon: const Icon(Icons.search),
              labelStyle: const TextStyle(color: Colors.black, fontSize: 16.4),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(height: 20,),
        TextButton(
          onPressed: () => cepBloc.add(FetchCepEvent(_cepController.text)),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(20.4),
              elevation: 4.4,
              alignment: Alignment.center,
            ),
          child: const Text('Buscar Cep', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),))
      ],
    );
  }

  Widget _loadedState(CepLoadedState state) {
    return Center(
      child: Column(
        children: [
          const Text('Cep carregado com sucesso', style: TextStyle(fontSize: 25.4,fontWeight: FontWeight.bold),),
          const SizedBox(height: 25.4,),
          Card(
            child: ListTile(
              title: Text('Cidade: ${state.getCep.city}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18.4),),
              subtitle: Text('Estado: ${state.getCep.state}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18.4),),
              style: ListTileStyle.list,
              contentPadding: const EdgeInsets.all(20.4),
            ),
            elevation: 4.4,
            color: Colors.grey,
            margin: const EdgeInsets.only(left: 45.4, right: 45.4),
          ),
          const SizedBox(height: 25.4,),
          Card(
            child: ListTile(
              title: Text('Cep ${state.getCep.zipcode}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18.4),),
              subtitle: Text('Endereço: ${state.getCep.address}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18.4),),
              style: ListTileStyle.list,
              contentPadding: const EdgeInsets.all(20.4),
            ),
            elevation: 4.4,
            color: Colors.grey,
            margin: const EdgeInsets.only(left: 45.4, right: 45.4),
          ),
        ],
      ),
    );
  }

  Widget _cepIsFullLoaded(CepBloc cepBloc, BuildContext context, CepLoadedState state) {
    return Column(
      children: [
        _loadedState(state),
        const SizedBox(height: 25.4,),
        TextButton(
         onPressed: () => cepBloc.add(ResetCepEvent()),
         style: TextButton.styleFrom(
           backgroundColor: Colors.blue,
           padding: const EdgeInsets.all(20.4),
           elevation: 4.4,
           alignment: Alignment.center,
         ),
         child: const Text('Buscar Cep', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final cepBloc = BlocProvider.of<CepBloc>(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CepBloc, CepState>(
            builder: (context, state) {
              if(state is CepInitState) {
                return _form(cepBloc, context);
              } else if(state is CepLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if(state is CepNotFoundState) {
                return const Text('Cep não encontrado');
            } else if(state is CepLoadedState) {
                return _cepIsFullLoaded(cepBloc, context, state);
              }
              return const Text('ERRO');
            }
        )
      ],
    );
  }
}
