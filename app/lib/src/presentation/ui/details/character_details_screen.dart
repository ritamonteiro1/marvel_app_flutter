import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/internationalization.dart';

import '../../bloc/details/character_details_bloc.dart';
import '../../bloc/details/character_details_event.dart';
import '../../bloc/details/character_details_state.dart';
import 'widgets/successfully_character_details.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({
    super.key,
    required this.characterId,
  });

  final int characterId;

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final characterId = widget.characterId;
    final strings = MarvelStrings.of(context);

    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
      builder: (context, state) {
        switch (state) {
          case InitialState():
            context.read<CharacterDetailsBloc>().add(RequestCharacterDetails(
                  characterId: characterId,
                ));
            return const LoadingScaffold();
          case SuccessRequestingDetails():
            final character = state.character;
            return SuccessfullyCharacterDetails(
              character: character,
              toggleCharacter: () {
                context
                    .read<CharacterDetailsBloc>()
                    .add(ToggleFavoriteCharacter(
                      character: character,
                    ));
              },
            );
          case GenericErrorRequestingDetails():
            return ErrorScaffold(
              onPressedButton: () {
                context.read<CharacterDetailsBloc>().add(TryRequestDetailsAgain(
                      characterId: characterId,
                    ));
              },
            );
          case NetworkErrorRequestingDetails():
            return ErrorScaffold.network(
              onPressedButton: () {
                context.read<CharacterDetailsBloc>().add(TryRequestDetailsAgain(
                      characterId: characterId,
                    ));
              },
            );
          case TryRequestingDetailsAgain():
            return LoadingScaffold(
              text: strings.message_trying_again,
            );
        }
      },
    );
  }

  @override
  void dispose() {
    context.read<CharacterDetailsBloc>().close();
    super.dispose();
  }
}
