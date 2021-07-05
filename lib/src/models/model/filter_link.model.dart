import 'package:equatable/equatable.dart';

class FilterLinkModel extends Equatable {
  const FilterLinkModel(
      {this.dateFrom,
      this.dateTo,
      this.groupWebsiteId,
      this.page,
      this.itemPerPage});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date_from': dateFrom,
        'date_to': dateTo,
        'group_website_id': groupWebsiteId,
        'page': page,
        'items_per_page': itemPerPage
      };

  Map<String, dynamic> toJsonNewspaper() => <String, dynamic>{
        'date_from': dateFrom,
        'date_to': dateTo,
        'page': page,
        'items_per_page': itemPerPage
      };
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final int? groupWebsiteId;
  final int? page;
  final int? itemPerPage;

  @override
  List<Object?> get props =>
      [dateFrom, dateTo, groupWebsiteId, page, itemPerPage];
}
