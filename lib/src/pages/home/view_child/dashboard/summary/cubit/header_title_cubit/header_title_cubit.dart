import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'header_title_state.dart';

class HeaderTitleCubit extends Cubit<HeaderTitleState> {
  HeaderTitleCubit() : super(const HeaderTitleState(title: ''));

  void doSetTitleForAppBar(String title) {
    emit(HeaderTitleState(title: title));
  }
}
