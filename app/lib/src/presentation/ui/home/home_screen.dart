import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/internationalization.dart';

import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../bloc/home/home_state.dart';
import 'widgets/successfully_character_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _setupScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = MarvelStrings.of(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state) {
          case InitialState():
            context.read<HomeBloc>().add(RequestCharacterList());
            return const LoadingScaffold();
          case SuccessRequestingCharacters():
            return SuccessfullyCharacterList(
              state: state,
              scrollController: _scrollController,
              floatingActionButtonOnClick: () {
                _goToInitialScrollPosition();
              },
            );
          case GenericErrorRequestingCharacters():
            return ErrorScaffold(
              onPressedButton: () {
                context.read<HomeBloc>().add(TryRequestCharacterListAgain());
              },
            );
          case NetworkErrorRequestingCharacters():
            return ErrorScaffold.network(
              onPressedButton: () {
                context.read<HomeBloc>().add(TryRequestCharacterListAgain());
              },
            );
          case TryRequestingCharactersAgain():
            return LoadingScaffold(
              text: strings.message_trying_again,
            );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    context.read<HomeBloc>();
    super.dispose();
  }

  void _setupScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(RequestMoreCharacterList());
      }
    });
  }

  void _goToInitialScrollPosition() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
