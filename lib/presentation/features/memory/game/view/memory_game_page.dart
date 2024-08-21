import 'dart:math';

import 'package:edu_app/presentation/features/memory/game/cubit/memory_game_cubit.dart';
import 'package:edu_app/presentation/features/memory/game/model/card_model.dart';
import 'package:edu_app/presentation/features/memory/game/model/memory_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../generated/assets.dart';

class MemoryGamePage extends StatelessWidget {
  final MemoryLevel level;

  const MemoryGamePage({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    context.read<MemoryGameCubit>().start(level: level);
    return Scaffold(
      body: BlocBuilder<MemoryGameCubit, MemoryGameState>(
        builder: (context, state) {
          return state.when(
              initial: () => Container(),
              game: (cards, level) => _gamePage(context, cards));
        },
      ),
    );
  }

  Widget _gamePage(BuildContext context, List<MemoryCard> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 45),
          child: _scoreBar(context, 12, 45, "00:15"),
        ),
        Expanded(
            child: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: _grid(cards, level)),
        ))
      ],
    );
  }

  Widget _scoreBar(
      BuildContext context, int attempts, int streak, String time) {
    final s = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text(s.attempts,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF839DBA))),
            Text(attempts.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF196AFF)))
          ],
        ),
        Row(
          children: [
            SizedBox(
                height: 16,
                width: 12,
                child: SvgPicture.asset(Assets.assetsIcStreak)),
            Text(streak.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF196AFF)))
          ],
        ),
        Row(
          children: [
            Text(s.time,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF839DBA))),
            Text(time,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF196AFF)))
          ],
        ),
      ],
    );
  }

  Widget _grid(List<MemoryCard> cards, MemoryLevel level) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: level.columns, childAspectRatio: 1),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return _buildCard(context, cards[index], index);
        });
  }

  Widget _buildCard(BuildContext context, MemoryCard card, int position) {
    return GestureDetector(
      onTap: () {
        context.read<MemoryGameCubit>().onCardClicked(position);
      },
      child: _buildCardContent(card),
    );
  }

  Widget _buildCardContent(MemoryCard card) {
    return MemoryCardWidget(
      toggler: card.state == MemoryCardState.opened ||
          card.state == MemoryCardState.guessed,
      frontCard: _buildFrontSide(card),
      backCard: _buildBackSide(),
    );
  }

  Widget _buildFrontSide(MemoryCard card) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(card.image),
      ),
    );
  }

  Widget _buildBackSide() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: LayoutBuilder(builder: (context, constraints) {
        const percentage = 0.5;
        final size = constraints.maxWidth * percentage;
        return Center(
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFA8C1DD)),
          ),
        );
      }),
    );
  }
}

class MemoryCardWidget extends StatelessWidget {
  final bool toggler;
  final Widget frontCard;
  final Widget backCard;

  const MemoryCardWidget({
    required this.toggler,
    required this.backCard,
    required this.frontCard,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: _transitionBuilder,
      layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease.flipped,
      child: toggler
          ? SizedBox(key: const ValueKey('front'), child: frontCard)
          : SizedBox(key: const ValueKey('back'), child: backCard),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: widget,
      builder: (context, widget) {
        final isFront = ValueKey(toggler) == widget!.key;
        final rotationY = isFront
            ? rotateAnimation.value
            : min(rotateAnimation.value, pi * 0.5);
        return Transform(
          transform: Matrix4.rotationY(rotationY)..setEntry(3, 0, 0),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
