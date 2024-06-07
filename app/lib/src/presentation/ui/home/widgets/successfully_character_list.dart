import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../../bloc/home/home_state.dart';
import '../../../navigation/marvel_routes.dart';

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
    final typography = theme.extension<MarvelTypography>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          MarvelStrings.of(context).app_bar_title_home_screen,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: colors.secondary),
            onPressed: () {
              goRouter.navigateToFavoriteCharactersScreen();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.floatingActionButtonOnClick.call();
        },
        child: const Icon(Icons.arrow_upward),
      ),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: characterHorizontalList.length,
                    itemBuilder: (context, index) {
                      final character = characterHorizontalList[index];
                      return CardPrimary.vertical(
                        text: character.name,
                        onClick: () {
                          goRouter.navigateToCharacterDetailsScreen(
                            characterId: character.id,
                          );
                        },
                        imageUrl: character.imageUrl,
                        imageHeight: 100,
                        imageWidth: 100,
                      );
                    },
                  ),
                ),
                const SizedBox(height: MarvelSpacing.x400),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: characterVerticalList.length,
                  itemBuilder: (context, index) {
                    final character = characterVerticalList[index];

                    return CardPrimary(
                      text: character.name,
                      onClick: () {
                        goRouter.navigateToCharacterDetailsScreen(
                          characterId: character.id,
                        );
                      },
                      imageUrl: character.imageUrl,
                      imageHeight: 100,
                      imageWidth: 100,
                    );
                  },
                ),
                const SizedBox(height: MarvelSpacing.x300),
                Visibility(
                  visible: state.hasNetworkErrorRequestingMore,
                  child: Text(strings.message_network_error),
                ),
                Visibility(
                  visible: state.hasGenericErrorRequestingMore,
                  child: Text(strings.message_generic_error),
                ),
                Visibility(
                  visible: state.hasFinishedPages,
                  child: Text(strings.message_no_more_characters),
                ),
                Visibility(
                  visible: state.isLoadingMore,
                  child: const CircularProgressIndicator(),
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
