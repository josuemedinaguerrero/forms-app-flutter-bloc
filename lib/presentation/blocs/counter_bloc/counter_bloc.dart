import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncreased>(_onCounterIncrease);
    on<CounterReset>(_onResetCounter);
  }

  void _onCounterIncrease(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + event.value, transactionCount: state.transactionCount + 1));
  }

  void _onResetCounter(_, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }
}
