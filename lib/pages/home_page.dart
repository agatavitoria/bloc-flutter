import 'package:bloc_example/blocs/counter_bloc.dart';
import 'package:bloc_example/widgets/counter_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build home');
    return BlocProvider.value(
      value: _counterBloc,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (_, state) {
                  return Text('counter is $state');
                },
              ),
              CounterLabel(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'increment',
              child: Icon(Icons.add),
              onPressed: () {
                _counterBloc.add(CounterEvents.increment);
              },
            ),
            FloatingActionButton(
              heroTag: 'decrement',
              child: Icon(Icons.remove),
              onPressed: () {
                _counterBloc.add(CounterEvents.decrement);
              },
            ),
            FloatingActionButton(
              heroTag: 'reset',
              child: Icon(Icons.restore),
              onPressed: () {
                _counterBloc.add(CounterEvents.reset);
              },
            ),
          ],
        ),
      ),
    );
  }
}