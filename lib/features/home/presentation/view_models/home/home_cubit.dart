import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final List<String> filters = const ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  void changeFilter(int index) {
    selectedIndex = index;
    emit(FilterChangedState());
  }
}
