import 'package:intro_redux/redux/counter/counter_actions.dart';

int counterReducer(int counter,action) {
  if(action is IncrementAction) {
    return counter+1;
  }
}