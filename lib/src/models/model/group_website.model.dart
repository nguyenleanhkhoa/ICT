import 'package:equatable/equatable.dart';

class GroupWebsiteModel extends Equatable {
  const GroupWebsiteModel(this.name, this.id);
  final String name;
  final int id;

  @override
  List<Object?> get props => [name, id];
}
