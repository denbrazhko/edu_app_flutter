import 'dart:math';

import 'package:edu_app/presentation/features/memory/game/cubit/memory_game_cubit.dart';
import 'package:edu_app/presentation/features/memory/game/model/card_model.dart';
import 'package:edu_app/presentation/features/memory/game/model/memory_level.dart';
import 'package:edu_app/presentation/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MemoryGamePage extends StatelessWidget {
  const MemoryGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MemoryGameCubit>().start();
    return Scaffold(
      body: Center(
        child: BlocBuilder<MemoryGameCubit, MemoryGameState>(
          builder: (context, state) {
            return state.when(
                initial: () => Container(),
                game: (cards, level) => Center(child: _grid(cards, level)));
          },
        ),
      ),
    );
  }

  Widget _grid(List<MemoryCard> cards, MemoryLevel level) {
    return GridView.builder(
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
