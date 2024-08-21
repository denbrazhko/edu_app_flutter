import 'package:edu_app/presentation/features/memory/game/model/memory_level.dart';
import 'package:edu_app/presentation/router/router.dart';
import 'package:edu_app/presentation/widgets/game_settings/game_settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';
import '../../../../style/colors.dart';

class MemorySettingsPage extends StatelessWidget {
  const MemorySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations s = AppLocalizations.of(context)!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GameSettingsTopBar(
                  _topBarContent(context, 12), Assets.assetsIcMemoryTopBar),
              GameSettingsTags([
                s.memorySettingsTag0,
                s.memorySettingsTag1,
                s.memorySettingsTag2,
                s.memorySettingsTag3
              ]),
              Container(
                margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                child: Text(
                  s.gameRules,
                  style: const TextStyle(
                      color: Color(0xFF0F2651),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  s.memoryRules,
                  style:
                      const TextStyle(color: Color(0xFF0F2651), fontSize: 12),
                ),
              ),
              const Divider(
                color: Color(0xFFE7EFF9),
                height: 24,
                endIndent: 8,
                indent: 8,
                thickness: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  s.taskDifficulty,
                  style: const TextStyle(
                      color: Color(0xFF0F2651),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              _difficultyGrid(context)
            ],
          ),
        ));
  }

  Widget _difficultyGrid(BuildContext context) {
    final levels = List.generate(
        8, (index) => _levelCard(context, MemoryLevel.values[index]));
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1),
          itemBuilder: (context, index) => levels[index]),
    );
  }

  Widget _levelCard(BuildContext context, MemoryLevel level) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push("${EduAppRouter.memoryGame}${level.name}");
      },
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        color: const Color(0xFFC4D4E6),
        child: Center(
          child: Text(
            level.title,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xFF196AFF)),
          ),
        ),
      ),
    );
  }

  Widget _topBarContent(BuildContext context, int bestStreak) {
    final AppLocalizations s = AppLocalizations.of(context)!;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 35, left: 16, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsIcBack),
            Expanded(child: Container()),
            Text(
              s.memory,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  s.bestStreak,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
                Text(
                  bestStreak.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
