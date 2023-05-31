import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_playground/bloc/counter_bloc.dart';
import 'package:flutter_bloc_playground/events/counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demo',
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Center(
              child: Text(
                '$count',
                style: const TextStyle(fontSize: 24.0),
              ),
            );
          },
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc
                  .add(DecrementEvent()); // Adiciona o evento de subtração
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
        ]));
  }
}
