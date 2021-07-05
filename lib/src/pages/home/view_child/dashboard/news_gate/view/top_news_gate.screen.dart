import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/news_link_bloc/news_link_bloc.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/cubit/drop_down_cubit/drop_down_cubit.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/widget/summary.widget.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class TopNewsGateScreen extends StatefulWidget {
  const TopNewsGateScreen({Key? key}) : super(key: key);

  @override
  _TopNewsGateScreenState createState() => _TopNewsGateScreenState();
}

class _TopNewsGateScreenState extends State<TopNewsGateScreen>
    with AutomaticKeepAliveClientMixin {
  int? selectedPageNumber;
  List<int> listPageNumber = <int>[10, 20, 30, 40, 50, 60, 70, 80, 90];

  List<String> listType = ['Website sở ngành', 'Website quận huyện'];
  @override
  void initState() {
    // context.read<HeaderTitleCubit>().doSetTitleForAppBar('Báo điện tử');
    context.read<NewsLinkBloc>().add(const GetNewsLinkEvent(itemOfPage: 1));
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<DropdownCubit, DropDownState>(
                builder: (context, state) {
                  return DropDownButtonOnlyTextWidget(
                    initValue: listType[0],
                    selectedItem: state.title,
                    listItem: listType,
                    onChanged: (value) {
                      context
                          .read<DropdownCubit>()
                          .selectedType(value.toString());
                    },
                    title: 'Loại',
                  );
                },
              ),
              BlocBuilder<DropdownCubit, DropDownState>(
                builder: (context, state) {
                  return DropDownButtonOnlyTextWidget(
                    initValue: listPageNumber[0],
                    selectedItem: state.page,
                    listItem: listPageNumber,
                    onChanged: (value) {
                      context
                          .read<DropdownCubit>()
                          .selectedNumberPage(value as int);
                    },
                    title: 'Số trang',
                  );
                },
              ),
            ],
          ),
          BlocBuilder<NewsLinkBloc, NewsLinkState>(
            builder: (context, state) {
              if (state.listNewsPaperLink != null) {
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
