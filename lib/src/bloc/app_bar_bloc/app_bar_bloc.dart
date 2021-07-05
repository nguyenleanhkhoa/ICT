import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(const AppBarState(title: ''));

  @override
  Stream<AppBarState> mapEventToState(AppBarEvent event) async* {
    if (event is HandleChangeTitleAppBarEvent) {
      yield await _mapHandleChangeAppBarTitle(event);
    }
  }

  Future<AppBarState> _mapHandleChangeAppBarTitle(
      HandleChangeTitleAppBarEvent event) async {
    return state.copyWith(title: event.title);
  }
}
