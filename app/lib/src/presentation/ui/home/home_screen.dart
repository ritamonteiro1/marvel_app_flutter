import 'package:app/src/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_event.dart';
import '../../bloc/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<HomeBloc>().add(RequestCharacterList());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
