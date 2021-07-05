import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/news_link_bloc/news_link_bloc.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/cubit/drop_down_cubit/drop_down_cubit.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/widget/summary.widget.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class User {
  const User(this.name);
  final String name;
}

class SummaryNewsScreen extends StatefulWidget {
  const SummaryNewsScreen({Key? key, this.groupId}) : super(key: key);
  final int? groupId;
  @override
  _SummaryNewsScreenState createState() => _SummaryNewsScreenState();
}

class _SummaryNewsScreenState extends State<SummaryNewsScreen>
    with AutomaticKeepAliveClientMixin {
  int? selectedPageNumber;
  List<int> listPageNumber = <int>[10, 20, 30, 40, 50, 60, 70, 80, 90];

  @override
  void initState() {
    // context.read<HeaderTitleCubit>().doSetTitleForAppBar('Báo điện tử');
    context.read<NewsLinkBloc>().add(const GetNewsLinkEvent(itemOfPage: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
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
                    context
                        .read<NewsLinkBloc>()
                        .add(GetNewsLinkEvent(itemOfPage: value));
                  },
                  title: 'Số trang',
                );
              },
            ),
          ),
          BlocBuilder<NewsLinkBloc, NewsLinkState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) => const ItemLoading()));
              } else if (state.listNewsPaperLink != null && !state.isLoading) {
                if (state.listNewsPaperLink.isNotEmpty) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.listNewsPaperLink.length,
                          itemBuilder: (context, ind) {
                            if (ind == 9) {
                              print(state.listNewsPaperLink);
                            }
                            return ItemNews(
                              title: state.listNewsPaperLink[ind].title,
                              urlImage: 'https://via.placeholder.com/100x50',
                              description:
                                  state.listNewsPaperLink[ind].description,
                              source:
                                  'Theo ${state.listNewsPaperLink[ind].name}',
                            );
                          }),
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
