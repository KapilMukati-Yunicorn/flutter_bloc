

// lib/bloc/counter_state.dart
sealed class CounterState {
  final int counterValue;
  const CounterState(this.counterValue);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterChanged extends CounterState {
  const CounterChanged(int value) : super(value);
}
