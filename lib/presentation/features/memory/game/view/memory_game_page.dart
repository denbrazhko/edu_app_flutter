import 'package:edu_app/presentation/features/memory/game/cubit/memory_game_cubit.dart';
import 'package:edu_app/presentation/features/memory/game/model/card_model.dart';
import 'package:edu_app/presentation/features/memory/game/model/memory_level.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          return _buildCard(context, cards[index]);
        });
  }

  Widget _buildCard(BuildContext context, MemoryCard card) {
    return GestureDetector(
      onTap: () {
        context.read<MemoryGameCubit>().onCardClicked(card);
      },
      child: _buildCardContent(card),
    );
  }

  Widget _buildCardContent(MemoryCard card) {
    switch (card.state) {
      case MemoryCardState.closed:
        return _animated(_buildBackSide());
      case MemoryCardState.opened:
        return _animated(_buildFrontSide(card));
      case MemoryCardState.guessed:
        return _buildFrontSide(card);
    }
  }

  Widget _animated(Widget widget) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          final flipAnim = Tween(begin: 0, end: 1).animate(animation);
          return AnimatedBuilder(
            animation: flipAnim,
            child: child,
            builder: (context, child) {
              final angle = flipAnim.value * 3.14159;
              final transform = Matrix4.rotationY(angle);
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: child,
              );
            },
          );
        },
        child: widget);
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
