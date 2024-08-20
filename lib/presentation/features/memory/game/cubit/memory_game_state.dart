part of 'memory_game_cubit.dart';

@freezed
class MemoryGameState with _$MemoryGameState {
  const factory MemoryGameState.initial() = _Initial;

  factory MemoryGameState.game(
      {required List<MemoryCard> cards, required MemoryLevel level}) = _Game;
}
