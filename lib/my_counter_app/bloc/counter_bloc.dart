import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState>{
//   CounterBloc() : super(const CounterInitial()){
//
//     // Increment Counter
//     on<IncrementCounter>((event, emit){
//       final newCount = state.count + 1;
//       emit(CounterUpdated(newCount));
//     });
//
//     // Decrement Counter
//     on<DecrementCounter>((event, emit){
//       late final newCount;
//        if(state.count>0){
//          newCount = state.count - 1;
//        }
//        emit(CounterUpdated(newCount));
//     });
//   }
// }

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(_incrementCounter);
    on<DecrementCounter>(_decrementCounter);
  }

  void _incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    if (state.count == 0) {
      return;
    }
    emit(state.copyWith(count: state.count - 1));
  }
}
