part of 'app_bar_bloc.dart';

class AppBarState extends Equatable {
  const AppBarState({required this.title});
  final String title;

  AppBarState copyWith({String? title}) {
    return AppBarState(title: title ?? this.title);
  }

  @override
  List<Object> get props => [title];
}
