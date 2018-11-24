import 'app_state.dart';
import 'package:intro_redux/redux/counter/counter_reducer.dart';

AppState appReducer(AppState state,action) {
  return AppState(count: counterReducer(state.count,action));
}