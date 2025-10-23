// lib/bloc/counter_event.dart
sealed class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}