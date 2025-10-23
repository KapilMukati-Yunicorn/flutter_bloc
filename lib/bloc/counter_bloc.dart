// lib/bloc/counter_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<Increment>((event, emit) {
      // old value + 1
      emit(CounterChanged(state.counterValue + 1));
    });

    on<Decrement>((event, emit) {
      // old value - 1
      emit(CounterChanged(state.counterValue - 1));
    });
  }
}
