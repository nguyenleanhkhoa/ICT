import 'package:flutter/material.dart';

class SummaryNewsSourceScreen extends StatefulWidget {
  const SummaryNewsSourceScreen({Key? key, this.groupId}) : super(key: key);
  final int? groupId;
  @override
  _SummaryNewsSourceScreenState createState() =>
      _SummaryNewsSourceScreenState();
}

class _SummaryNewsSourceScreenState extends State<SummaryNewsSourceScreen> {
  @override
  void initState() {
    // context.read<HeaderTitleCubit>().doSetTitleForAppBar('Trích dẫn');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tính năng đang phát triển'),
    );
  }
}
