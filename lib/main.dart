import 'package:example_bloc_cep/bloc/cep_bloc.dart';
import 'package:example_bloc_cep/service/service.dart';
import 'package:example_bloc_cep/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('EXEMPLO CEP'),),
        body: BlocProvider(
            lazy: false,
            create: (context) => CepBloc(CepService()),
            child: HomePage(),
        )
      )
    );
  }
}


