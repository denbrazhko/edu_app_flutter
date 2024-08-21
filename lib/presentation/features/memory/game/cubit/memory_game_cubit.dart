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

  static const blockDuration = 600;

  var _isGesturesBlocked = false;

  MemoryCard? _firstClicked;
  MemoryCard? _secondClicked;

  MemoryLevel _level = MemoryLevel.l3x4;

  void start({MemoryLevel level = MemoryLevel.l3x4}) {
    _level = level;
    _generateCards();
  }

  void onCardClicked(int position) {
    final cards = _getStateCards();
    final card = cards[position];
    if (_isGesturesBlocked) return;
    if (card.state != MemoryCardState.closed) return;
    if (_firstClicked == null) {
      _firstClicked = card;
    } else {
      _secondClicked ??= card;
    }
    cards[position] = card.copyWith(state: MemoryCardState.opened);
    emit(MemoryGameState.game(cards: cards, level: _level));
    _checkForAMatch();
  }

  void _checkForAMatch() {
    if (_firstClicked == null || _secondClicked == null) return;
    if (_firstClicked?.image == _secondClicked?.image) {
      _match();
    } else {
      _mismatch();
    }
  }

  void _match() {
    _firstClicked = _firstClicked?.copyWith(state: MemoryCardState.guessed);
    _secondClicked = _secondClicked?.copyWith(state: MemoryCardState.guessed);
    final cards = _getStateCards();
    cards[_firstClicked!.position] = _firstClicked!;
    cards[_secondClicked!.position] = _secondClicked!;
    emit(MemoryGameState.game(cards: cards, level: _level));
    _firstClicked = null;
    _secondClicked = null;
  }

  void _mismatch() {
    _isGesturesBlocked = true;
    Future.delayed(const Duration(milliseconds: blockDuration), () {
      _closeMissedCards();
    });
  }

  void _closeMissedCards() {
    _firstClicked = _firstClicked?.copyWith(state: MemoryCardState.closed);
    _secondClicked = _secondClicked?.copyWith(state: MemoryCardState.closed);
    final cards = _getStateCards();
    cards[_firstClicked!.position] = _firstClicked!;
    cards[_secondClicked!.position] = _secondClicked!;
    emit(MemoryGameState.game(cards: cards, level: _level));
    _isGesturesBlocked = false;
    _firstClicked = null;
    _secondClicked = null;
  }

  List<MemoryCard> _getStateCards() {
    return (state as _Game).cards.toList();
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
    icons.shuffle();
    icons.forEachIndexed((index, value) {
      cards.add(MemoryCard(
          position: index, image: value, state: MemoryCardState.closed));
    });
    emit(MemoryGameState.game(cards: cards, level: _level));
  }
}
