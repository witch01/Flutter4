import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState());

  void increment([int plus=1]){
    final count = state.count + plus;
    final updateState = CounterState(count: count);
    emit(updateState);
  }

  void decrement([int minus=1]){
    final count = state.count - minus;
    final updateState = CounterState(count: count);
    emit(updateState);
  }
}



class CounterState{
  final int count;
  CounterState({
    this.count = 0
  });
}