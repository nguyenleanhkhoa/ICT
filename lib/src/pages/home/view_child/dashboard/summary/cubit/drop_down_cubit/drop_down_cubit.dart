import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drop_down_state.dart';

class DropdownCubit extends Cubit<DropDownState> {
  DropdownCubit() : super(const DropDownState(page: 10));
  void selectedNumberPage(int page) {
    emit(state.copyWith(page: page));
  }

  void selectedType(String type) {
    emit(state.copyWith(title: type));
  }
}
