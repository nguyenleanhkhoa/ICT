import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(const LoadingState());

  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if (event is EventLoading) {
      yield await _mapLoadingToState(event.isLoading);
    }
  }

  Future<LoadingState> _mapLoadingToState(bool isLoading) async {
    return LoadingState(isLoading: isLoading);
  }
}
