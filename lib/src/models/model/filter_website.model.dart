import 'package:equatable/equatable.dart';

class FilterWebsiteModel extends Equatable {
  const FilterWebsiteModel(
      {this.isActive,
      this.isExpired,
      this.isLive,
      this.keyword,
      this.groupWebsiteId,
      this.page,
      this.itemPerPage});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_active': isActive,
        'is_expired': isExpired,
        'is_live': isLive,
        'keyword': keyword,
        'group_website_id': groupWebsiteId,
        'page': page,
        'items_per_page': itemPerPage
      };
  final int? isActive;
  final int? isExpired;
  final int? groupWebsiteId;
  final int? isLive;
  final String? keyword;
  final int? page;
  final int? itemPerPage;

  @override
  List<Object?> get props =>
      [isActive, isExpired, groupWebsiteId, isLive, keyword, page, itemPerPage];
}
