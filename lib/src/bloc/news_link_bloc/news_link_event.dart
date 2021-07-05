part of 'news_link_bloc.dart';

abstract class NewsLinkEvent extends Equatable {
  const NewsLinkEvent();

  @override
  List<Object> get props => [];
}

class GetNewsLinkGateEvent extends NewsLinkEvent {
  const GetNewsLinkGateEvent({this.groupWebsiteId, this.itemPerPage});
  final int? groupWebsiteId;
  final int? itemPerPage;
}

class GetNewsLinkEvent extends NewsLinkEvent {
  const GetNewsLinkEvent({this.itemOfPage});
  final int? itemOfPage;
}

class LoadingGetEvent extends NewsLinkEvent {
  const LoadingGetEvent(this.isLoading);

  final bool isLoading;
}
