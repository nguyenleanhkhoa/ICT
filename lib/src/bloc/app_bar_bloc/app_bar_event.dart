part of 'app_bar_bloc.dart';

abstract class AppBarEvent extends Equatable {
  const AppBarEvent();

  @override
  List<Object> get props => [];
}

class HandleChangeTitleAppBarEvent extends AppBarEvent {
  const HandleChangeTitleAppBarEvent({required this.title});

  final String title;
}
