import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/news_link_bloc/news_link_bloc.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/cubit/drop_down_cubit/drop_down_cubit.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/widget/summary.widget.dart';

import 'package:newsdailymobile/src/shared/shared.dart';
import 'package:newsdailymobile/src/shared/widget/placeholder_loading.widget.dart';

class SummaryNewsGateScreen extends StatefulWidget {
  const SummaryNewsGateScreen({Key? key, this.groupId}) : super(key: key);
  final int? groupId;
  @override
  _SummaryNewsGateScreenState createState() => _SummaryNewsGateScreenState();
}

class _SummaryNewsGateScreenState extends State<SummaryNewsGateScreen>
    with AutomaticKeepAliveClientMixin {
  int? selectedPageNumber;
  List<int> listPageNumber = <int>[10, 20, 30, 40, 50, 60, 70, 80, 90];
  @override
  void initState() {
    // context.read<HeaderTitleCubit>().doSetTitleForAppBar('Cổng thông tin');

    context.read<NewsLinkBloc>().add(
        GetNewsLinkGateEvent(groupWebsiteId: widget.groupId, itemPerPage: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: BlocBuilder<DropdownCubit, DropDownState>(
            builder: (context, state) {
              return DropDownButtonOnlyTextWidget(
                initValue: 10,
                selectedItem: state.page,
                listItem: listPageNumber,
                onChanged: (value) {
                  context
                      .read<DropdownCubit>()
                      .selectedNumberPage(value as int);
                  context.read<NewsLinkBloc>().add(GetNewsLinkGateEvent(
                      groupWebsiteId: widget.groupId, itemPerPage: value));
                },
                title: 'Số trang',
              );
            },
          ),
        ),
        const PlaceholderLoading(),
        BlocBuilder<NewsLinkBloc, NewsLinkState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => const ItemLoading()));
            } else if (state.listLink != null && !state.isLoading) {
              if (state.listLink.isNotEmpty) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listLink.length,
                        itemBuilder: (context, ind) {
                          return ItemNews(
                            title: state.listLink[ind].title,
                            urlImage: 'https://via.placeholder.com/100x50',
                            description: state.listLink[ind].description,
                            source: 'Theo ${state.listLink[ind].name}',
                          );
                        }),
                  ),
                );
              } else if (state.listLink.isEmpty) {
                return const Center(
                  child: Text('Không có dữ liệu!'),
                );
              }
            }
            return const SizedBox();
          },
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
