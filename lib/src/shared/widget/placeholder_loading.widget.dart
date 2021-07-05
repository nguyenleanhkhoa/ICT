import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/loading_bloc/loading_bloc.dart';

class PlaceholderLoading extends StatefulWidget {
  const PlaceholderLoading({Key? key}) : super(key: key);

  @override
  _PlaceholderLoadingState createState() => _PlaceholderLoadingState();
}

class _PlaceholderLoadingState extends State<PlaceholderLoading> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: Text('Loading....'));
        }
        return const SizedBox();
      },
    );
  }
}
