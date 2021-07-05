part of 'news_link_bloc.dart';

class NewsLinkState extends Equatable {
  const NewsLinkState(
      {required this.listLink,
      required this.listNewsPaperLink,
      this.isLoading = false});
  final List<Link> listLink;
  final List<Link> listNewsPaperLink;
  final bool isLoading;

  NewsLinkState copyWith(
          {List<Link>? listLink,
          List<Link>? listNewsPaperLink,
          bool? isLoading}) =>
      NewsLinkState(
          listLink: listLink ?? this.listLink,
          listNewsPaperLink: listNewsPaperLink ?? this.listNewsPaperLink,
          isLoading: isLoading ?? this.isLoading);

  @override
  List<Object> get props => [listLink, listNewsPaperLink, isLoading];
}
