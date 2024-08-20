import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:edu_app/presentation/features/memory/game/model/card_model.dart';
import 'package:edu_app/presentation/features/memory/game/model/memory_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'memory_game_state.dart';

part 'memory_game_helper.dart';

part 'memory_game_cubit.freezed.dart';

class MemoryGameCubit extends Cubit<MemoryGameState> {
  MemoryGameCubit() : super(const MemoryGameState.initial());

  final MemoryLevel _level = MemoryLevel.l3x4;

  void start({MemoryLevel level = MemoryLevel.l3x4}) {
    _generateCards();
  }

  void onCardClicked(MemoryCard card){
    if(state is _Initial) {

    }
    final cards = (state as _Game).cards.toList();
    final index = cards.indexOf(card);
    if(cards[index].state == MemoryCardState.closed){
      cards[index] = cards[index].copyWith(state: MemoryCardState.opened);
    } else if(cards[index].state == MemoryCardState.opened){
      cards[index] = cards[index].copyWith(state: MemoryCardState.closed);
    }
    emit(MemoryGameState.game(cards: cards, level: _level));

  }


  void _generateCards() {
    final uniqueCount = _level.count ~/ 2;
    final allIcons = getIconsList(uniqueCount);
    final randomIndices = getRandomIndices(uniqueCount, allIcons.length);
    final cards = <MemoryCard>[];
    final icons = <String>[];
    for (final i in randomIndices) {
      icons.add(allIcons[i]);
      icons.add(allIcons[i]);
    }
    icons.forEachIndexed((index, value) {
      cards.add(MemoryCard(
          position: index, image: value, state: MemoryCardState.closed));
    });
    icons.shuffle();
    emit(MemoryGameState.game(cards: cards, level: _level));
  }
}
