import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsdailymobile/src/common/Utils/utils_common.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_certificate_expired.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_news.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_news_gate.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_news_post.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_news_source.screen.dart';
import 'package:newsdailymobile/src/pages/home/widgets/widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

List<TabScreenModel> tabName = [
  TabScreenModel(
      title: 'Báo điện tử',
      widget: SummaryNewsScreen(
        groupId: GroupWebsiteId.none,
      )),
  TabScreenModel(
      title: 'Cổng Thông tin',
      widget: SummaryNewsGateScreen(
        groupId: GroupWebsiteId.congthongtinsonganh,
      )),
  TabScreenModel(
      title: 'Bài viết ',
      widget: SummaryNewsPostScreen(
        groupId: GroupWebsiteId.none,
      )),
  const TabScreenModel(title: 'Trích dẫn', widget: SummaryNewsSourceScreen()),
  const TabScreenModel(
      title: 'Giấy phép', widget: SummaryCertificateExpiredScreen()),
];

List<Widget> listTab = [];

class ItemNews extends StatelessWidget {
  final String? title;
  final String? urlImage;
  final String? description;
  final String? source;
  const ItemNews(
      {Key? key, this.title, this.urlImage, this.description, this.source})
      : super(key: key);

  String formatImage(String image) {
    String imageUrl = 'https://via.placeholder.com/100x50';
    if (image.isNotEmpty && checkHTML(image)) {
      const String startFormatStr = '<img src=';
      int indexEnd = -1;
      if (image.contains(HtmlString.jpg)) {
        indexEnd = image.indexOf(HtmlString.jpg) + (HtmlString.jpg.length + 1);
      } else if (image.contains(HtmlString.png)) {
        indexEnd = image.indexOf(HtmlString.png) + (HtmlString.png.length + 1);
      }
      if (indexEnd != -1 && image.contains(startFormatStr)) {
        imageUrl = image.substring(
            image.indexOf(startFormatStr) + startFormatStr.length + 1,
            indexEnd + 4);
      }
    }

    return imageUrl;
  }

  String formatDescription(String str) {
    print(str);
    String description = str;
    if (checkHTML(str)) {
      description = str.substring(str.lastIndexOf(RegExp(r'>')) + 1);
      return description;
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Container(
        height: 105.0,
        padding: const EdgeInsets.only(
            top: 9.0, left: 18.0, bottom: 12.0, right: 18.0),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toString(),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: AppColor.titleColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.0,
                  width: 100.0,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: formatImage(description!),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Container(
                            height: 50.0,
                            width: 100.0,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          )),
                ),
                const SizedBox(
                  width: 11.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 56.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description.toString().isNotEmpty
                              ? formatDescription(description.toString())
                              : '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black),
                        ),
                        Text(source.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.grey.shade400))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemLoading extends StatefulWidget {
  const ItemLoading({Key? key}) : super(key: key);

  @override
  _ItemLoadingState createState() => _ItemLoadingState();
}

class _ItemLoadingState extends State<ItemLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 1), //Default value
      interval:
          const Duration(seconds: 1), //Default value: Duration(seconds: 0)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Container(
          height: 101.0,
          padding: const EdgeInsets.only(
              top: 9.0, left: 18.0, bottom: 12.0, right: 18.0),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredBox(color: Colors.grey.shade300),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      color: Colors.grey.shade100,
                      height: 60.0,
                      width: 100.0,
                      child: const SizedBox()),
                  const SizedBox(
                    width: 11.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
