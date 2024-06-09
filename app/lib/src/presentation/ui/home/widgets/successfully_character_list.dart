import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../../bloc/home/home_state.dart';
import '../../../navigation/marvel_routes.dart';
import 'character_horizontal_list.dart';
import 'character_vertical_list.dart';

class SuccessfullyCharacterList extends StatefulWidget {
  const SuccessfullyCharacterList({
    super.key,
    required this.state,
    required this.scrollController,
    required this.floatingActionButtonOnClick,
  });

  final SuccessRequestingCharacters state;
  final ScrollController scrollController;
  final VoidCallback floatingActionButtonOnClick;

  @override
  State<SuccessfullyCharacterList> createState() =>
      _SuccessfullyCharacterListState();
}

class _SuccessfullyCharacterListState extends State<SuccessfullyCharacterList> {
  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final characterVerticalList = state.characterVerticalList;
    final characterHorizontalList = state.characterHorizontalList;
    final strings = MarvelStrings.of(context);
    final theme = Theme.of(context);
    final colors = theme.extension<MarvelColors>()!;
    final goRouter = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          MarvelStrings.of(context).app_bar_title_home_screen,
        ),
        actions: [
          IconButton(
            tooltip: strings.semantic_label_icon_button_favorite,
            icon: Icon(Icons.favorite, color: colors.secondary),
            onPressed: () {
              goRouter.navigateToFavoriteCharactersScreen();
            },
          ),
        ],
      ),
      floatingActionButton: ReturnToTopFAB(onClick: () {
        widget.floatingActionButtonOnClick.call();
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MarvelSpacing.x300,
            ),
            child: Column(
              children: [
                const SizedBox(height: MarvelSpacing.x300),
                SizedBox(
                  height: 200,
                  child: CharacterHorizontalList(
                    list: characterHorizontalList,
                    onClickCard: (int characterId) {
                      goRouter.navigateToCharacterDetailsScreen(
                        characterId: characterId,
                      );
                    },
                  ),
                ),
                const SizedBox(height: MarvelSpacing.x400),
                CharacterVerticalList(
                  list: characterVerticalList,
                  onClickCard: (int characterId) {
                    goRouter.navigateToCharacterDetailsScreen(
                      characterId: characterId,
                    );
                  },
                ),
                const SizedBox(height: MarvelSpacing.x300),
                WarningText(
                  isVisible: state.hasNetworkErrorRequestingMore,
                  message: strings.message_network_error,
                ),
                WarningText(
                    isVisible: state.hasGenericErrorRequestingMore,
                    message: strings.message_generic_error),
                WarningText(
                  isVisible: state.hasFinishedPages,
                  message: strings.message_no_more_characters,
                ),
                Visibility(
                  visible: state.isLoadingMore,
                  child: CircularProgressIndicator(color: colors.primary),
                ),
                const SizedBox(height: MarvelSpacing.x300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
