
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_cubit/cubit/states.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment() {
    emit(CounterState(state.counterValue + 1));

  }
  void decrement() {

    emit(CounterState(state.counterValue - 1));
  }
}
