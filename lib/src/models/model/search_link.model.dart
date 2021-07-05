import 'package:equatable/equatable.dart';

class SearchLinkModel extends Equatable {
  const SearchLinkModel({this.totalLink = 0, this.keywordLinks});

  factory SearchLinkModel.fromJson(Map<String, dynamic> data) {
    if (data['keyword_links'] != null) {
      final tagObjsJson = data['keyword_links'] as List;
      final List<SearchLinkDetailModel> listData = tagObjsJson
          .map((linksJson) =>
              SearchLinkDetailModel.fromJson(linksJson as Map<String, dynamic>))
          .toList();
      return SearchLinkModel(
          keywordLinks: listData, totalLink: data['total_links'] as int);
    } else {
      return SearchLinkModel(
          totalLink: data['total_links'] as int,
          keywordLinks: data['keyword_links'] as List<SearchLinkDetailModel>);
    }
  }
  final int? totalLink;
  final List<SearchLinkDetailModel>? keywordLinks;

  @override
  List<Object?> get props => [totalLink, keywordLinks];
}

class SearchLinkDetailModel extends Equatable {
  const SearchLinkDetailModel(
      {this.id,
      this.url,
      this.title,
      this.createdAt,
      this.websiteId,
      this.violated,
      this.websiteName,
      this.websiteUrl});

  factory SearchLinkDetailModel.fromJson(Map<String, dynamic> data) {
    return SearchLinkDetailModel(
        id: data['id'] as int,
        url: data['url'].toString(),
        title: data['title'].toString(),
        createdAt: data['created_at'] == null
            ? DateTime.now()
            : DateTime.parse(data['created_at'].toString()),
        violated: data['violated'] as bool,
        websiteId: data['website_id'] as int,
        websiteName: data['website_name'].toString(),
        websiteUrl: data['website_url'].toString());
  }
  final int? id;
  final String? url;
  final String? title;
  final DateTime? createdAt;
  final int? websiteId;
  final bool? violated;
  final String? websiteName;
  final String? websiteUrl;

  @override
  List<Object?> get props =>
      [id, url, title, createdAt, websiteId, violated, websiteName, websiteUrl];
}
