import 'package:edu_app/presentation/widgets/pressable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';
import '../../../style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations s = AppLocalizations.of(context)!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: _appBar(context, 522),
          body: Column(
            children: [
              _dailyCard(context, 152),
              Expanded(
                  child: _gameCardWithPadding(s.logic, s.homeLogicDescr,
                      Assets.assetsIcDailyLogicBigThumb, () {})),
              Expanded(
                  child: _gameCardWithPadding(s.memory, s.homeMemoryDescr,
                      Assets.assetsIcDailyMemoryBigThumb, () {})),
              Expanded(
                  child: _gameCardWithPadding(s.mental, s.homeMentalDescr,
                      Assets.assetsIcDailyMentalBigThumb, () {})),
              Expanded(
                  child: _gameCardWithPadding(s.attention, s.homeAttentionDescr,
                      Assets.assetsIcDailyAttentionBigThumb, () {})),
              Expanded(
                  child: _gameCardWithPadding(s.reading, s.homeReadingDescr,
                      Assets.assetsIcDailyReadingBigThumb, () {})),
            ],
          ),
        ));
  }

  PreferredSizeWidget _appBar(BuildContext context, int score) {
    final AppLocalizations s = AppLocalizations.of(context)!;
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(16))),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 16, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  s.appTitle,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F2651)),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          colors: AppColors.blueGradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 18,
                            width: 18,
                            child:
                                SvgPicture.asset(Assets.assetsIcHomeBrain)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          score.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          colors: AppColors.orangeGradient,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    child: const Text(
                      "PRO",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _dailyCard(BuildContext context, int score) {
    final AppLocalizations s = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: AppColors.homeDailyGradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 42),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.daily,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        s.homeDailyDescr,
                        style: const TextStyle(
                            color: Color(0xFFAEBDCD),
                            fontWeight: FontWeight.w300,
                            fontSize: 10),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        s.currentScore(score),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 8),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                child: SizedBox(
                    height: 114,
                    width: 114,
                    child: Image.asset(Assets.assetsIcDailyBraingSq)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _gameCardWithPadding(
      String title, String description, String image, VoidCallback onClick) {
    return PressableWidget(
      onPressed: onClick,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: _gameCard(title, description, image)),
    );
  }

  Widget _gameCard(String title, String description, String image) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF0F2651)),
                ),
                const SizedBox(height: 8),
                Text(description,
                    style:
                        const TextStyle(fontSize: 11, color: Color(0xFFAEBDCD)))
              ],
            ),
          )),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
            child: AspectRatio(
              aspectRatio: 1 / 0.92,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
