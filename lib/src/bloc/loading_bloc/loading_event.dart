part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class EventLoading extends LoadingEvent {
  const EventLoading({this.isLoading = false});
  final bool isLoading;
}
