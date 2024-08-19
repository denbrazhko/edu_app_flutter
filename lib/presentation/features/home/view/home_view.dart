import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            children: [
              Expanded(
                  child: _gameCardWithPadding(
                      "Logic",
                      "Boost your intellect by solving tricky tasks",
                      "assets/ic_daily_logic_big_thumb.png")),
              Expanded(
                  child: _gameCardWithPadding(
                      "Logic",
                      "Boost your intellect by solving tricky tasks",
                      "assets/ic_daily_logic_big_thumb.png")),
              Expanded(
                  child: _gameCardWithPadding(
                      "Logic",
                      "Boost your intellect by solving tricky tasks",
                      "assets/ic_daily_logic_big_thumb.png")),
              Expanded(
                  child: _gameCardWithPadding(
                      "Logic",
                      "Boost your intellect by solving tricky tasks",
                      "assets/ic_daily_logic_big_thumb.png")),
              Expanded(
                  child: _gameCardWithPadding(
                      "Logic",
                      "Boost your intellect by solving tricky tasks",
                      "assets/ic_daily_logic_big_thumb.png")),
            ],
          ),
        ));
  }

  Widget _gameCardWithPadding(String title, String description, String image) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: _gameCard(title, description, image));
  }

  Widget _gameCard(String title, String description, String image) {
    return GestureDetector(
      onTap: () {},
      child: Card(
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
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFFAEBDCD)))
                ],
              ),
            )),
            AspectRatio(
              aspectRatio: 1 / 0.92,
              child: Image.asset(image, fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}
