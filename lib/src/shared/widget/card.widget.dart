import 'package:flutter/material.dart';

@immutable
class CardCustom extends StatefulWidget {
  const CardCustom(
      {Key? key, this.title, this.urlImage, this.decoration, this.routeMonitor})
      : super(key: key);
  final String? title;
  final String? urlImage;
  final Decoration? decoration;
  final String? routeMonitor;

  @override
  _CardCustomState createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, widget.routeMonitor.toString());
      },
      child: Container(
        decoration: widget.decoration,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(widget.urlImage.toString()),
            const SizedBox(height: 25.0),
            Text(widget.title.toString(),
                style: Theme.of(context).textTheme.caption)
          ],
        ),
      ),
    );
  }
}
