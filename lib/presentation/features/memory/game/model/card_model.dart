import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';

@freezed
class MemoryCard with _$MemoryCard {
  factory MemoryCard(
      {required int position,
      required String image,
      required MemoryCardState state}) = _MemoryCard;
}

enum MemoryCardState { closed, opened, guessed }
