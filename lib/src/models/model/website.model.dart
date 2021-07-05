import 'package:equatable/equatable.dart';

class WebsiteModel extends Equatable {
  const WebsiteModel({this.total = 0, this.websites});
  factory WebsiteModel.fromJson(Map<String, dynamic> data) {
    if (data['websites'] != null) {
      final tagObjsJson = data['websites'] as List;
      final List<WebsiteDetailModel> listData = tagObjsJson
          .map((linksJson) =>
              WebsiteDetailModel.fromJson(linksJson as Map<String, dynamic>))
          .toList();

      return WebsiteModel(
          websites: listData, total: data['total_links'] as int);
    } else {
      return WebsiteModel(
          websites: data['websites'] as List<WebsiteDetailModel>,
          total: data['total_links'] as int);
    }
  }
  final int? total;
  final List<WebsiteDetailModel>? websites;

  @override
  List<Object?> get props => [total, websites];
}

class WebsiteDetailModel extends Equatable {
  const WebsiteDetailModel({
    this.id,
    this.name,
    this.url,
    this.domain,
    this.isActive,
    this.groupWebsiteId,
    this.rank,
    this.licenseNumber,
    this.licenseCreatedAt,
    this.ownerOrganizationName,
    this.responsibleUserName,
    this.licenseExpireTime,
    this.licenseExpireAt,
    this.activityHistory,
    this.isLive,
  });

  factory WebsiteDetailModel.fromJson(Map<String, dynamic> data) =>
      WebsiteDetailModel(
          id: data['id'] as int,
          name: data['name'].toString(),
          url: data['url'].toString(),
          domain: data['domain'].toString(),
          isActive: data['is_active'] as bool,
          groupWebsiteId: data['group_website_id'] as int,
          rank: data['rank'] as int,
          licenseNumber: data['license_number'].toString(),
          licenseCreatedAt: data['license_created_at'] == null
              ? DateTime.now()
              : DateTime.parse(data['license_created_at'].toString()),
          ownerOrganizationName: data['owner_organization_name'].toString(),
          responsibleUserName: data['responsible_user_name'].toString(),
          licenseExpireTime: data['license_expire_time'] as int,
          licenseExpireAt: data['license_expire_at'] == null
              ? DateTime.now()
              : DateTime.parse(data['license_expire_at'].toString()),
          activityHistory: data['activity_history'].toString(),
          isLive: data['is_live'] as bool);

  final int? id;
  final String? name;
  final String? url;
  final String? domain;
  final bool? isActive;
  final int? groupWebsiteId;
  final int? rank;
  final String? licenseNumber;
  final DateTime? licenseCreatedAt;
  final String? ownerOrganizationName;
  final String? responsibleUserName;
  final int? licenseExpireTime;
  final DateTime? licenseExpireAt;
  final String? activityHistory;
  final bool? isLive;

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        domain,
        isActive,
        groupWebsiteId,
        rank,
        licenseNumber,
        licenseCreatedAt,
        ownerOrganizationName,
        responsibleUserName,
        licenseExpireTime,
        licenseExpireAt,
        activityHistory,
        isLive
      ];
}
