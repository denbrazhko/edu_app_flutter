import 'package:edu_app/presentation/features/home/home.dart';
import 'package:edu_app/presentation/features/memory/game/model/card_model.dart';
import 'package:edu_app/presentation/features/memory/game/model/memory_level.dart';
import 'package:edu_app/presentation/features/memory/game/view/memory_game_page.dart';
import 'package:edu_app/presentation/features/memory/settings/view/memory_settings_page.dart';
import 'package:edu_app/presentation/features/splash/view/splash_page.dart';
import 'package:go_router/go_router.dart';

class EduAppRouter {
  static const splash = "/";
  static const home = "/home";
  static const memorySettings = "/memory";
  static const memoryGame = "/memory/game/";

  final GoRouter router = GoRouter(routes: [
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(path: home, builder: (context, state) => const HomePage()),
    GoRoute(
        path: memorySettings,
        builder: (context, state) => const MemorySettingsPage()),
    GoRoute(
        path: "$memoryGame:level",
        builder: (context, state) {
          final level = state.pathParameters["level"];
          return MemoryGamePage(level: MemoryLevel.values.byName(level!));
        })
  ]);
}
