import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/base_bloc/base.bloc.dart';
import 'package:newsdailymobile/src/common/Utils/http_common.dart';
import 'package:newsdailymobile/src/domain/link_repository/link.repo.dart';
import 'package:newsdailymobile/src/domain/newspaper_repository/newspaper.repo.dart';
import 'package:newsdailymobile/src/models/models.dart';

part 'news_link_event.dart';
part 'news_link_state.dart';

class NewsLinkBloc extends Bloc<NewsLinkEvent, NewsLinkState> {
  NewsLinkBloc(
      {required LinkRepository linkRepository,
      required NewspaperRepository newspaperRepository})
      : linkRepo = linkRepository,
        newspaperRepo = newspaperRepository,
        super(const NewsLinkState(listLink: [], listNewsPaperLink: []));
  LinkRepository linkRepo;
  NewspaperRepository newspaperRepo;
  var bloc = BaseObserver();
  @override
  Stream<NewsLinkState> mapEventToState(NewsLinkEvent event) async* {
    if (event is GetNewsLinkGateEvent) {
      yield* _mapGetNewsLinkGateEventToState(event);
    } else if (event is GetNewsLinkEvent) {
      yield* _mapGetNewsLinkEventToState(event);
    } else if (event is LoadingGetEvent) {
      yield await _mapLoadingToState(event.isLoading);
    }
  }

  Stream<NewsLinkState> _mapGetNewsLinkGateEventToState(
      GetNewsLinkGateEvent event) async* {
    yield state.copyWith(isLoading: true);
    final BaseResponseModel<LinkModel> responseModel =
        await linkRepo.getLinkLates(
            groupWebsiteId: event.groupWebsiteId,
            numberPage: event.itemPerPage);
    if (responseModel.statusCode == StatusCode.successResponse) {
      yield state.copyWith(
          listLink: responseModel.result!.links, isLoading: false);
    } else {
      yield state.copyWith(listLink: []);
    }
  }

  Future<NewsLinkState> _mapLoadingToState(bool isLoading) async {
    return state.copyWith(isLoading: isLoading);
  }

  Stream<NewsLinkState> _mapGetNewsLinkEventToState(
      GetNewsLinkEvent event) async* {
    yield state.copyWith(isLoading: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    final BaseResponseModel<LinkModel> responseModel =
        await newspaperRepo.getNewspaperlates(itemPerPage: event.itemOfPage);
    if (responseModel.statusCode == StatusCode.successResponse) {
      yield state.copyWith(
          listNewsPaperLink: responseModel.result!.links, isLoading: false);
    } else {
      yield state.copyWith(listNewsPaperLink: []);
    }
  }
}
