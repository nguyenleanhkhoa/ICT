part of 'drop_down_cubit.dart';

class DropDownState extends Equatable {
  const DropDownState({this.page = 10, this.title = '', this.listItem});
  final List<dynamic>? listItem;
  final int page;
  final String title;

  DropDownState copyWith({int? page, String? title}) {
    return DropDownState(page: page ?? this.page, title: title ?? this.title);
  }

  @override
  List<Object> get props => [page, title];
}
