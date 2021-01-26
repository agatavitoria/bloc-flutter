import 'dart:developer';

import 'package:bloc/bloc.dart';

enum CounterEvents { increment, decrement, reset }

class CounterBloc extends Bloc<CounterEvents, int> {
  @override
  int get initialState => 50;

  @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    switch (event) {
      case CounterEvents.increment : yield this.state+1;
        break;
      case CounterEvents.decrement : yield this.state-1;
        break;
      default: yield 50;
    }
  }
}