import 'package:edu_app/presentation/features/home/home.dart';
import 'package:edu_app/presentation/features/memory/game/model/card_model.dart';
import 'package:edu_app/presentation/features/memory/game/view/memory_game_page.dart';
import 'package:edu_app/presentation/features/splash/view/splash_page.dart';
import 'package:go_router/go_router.dart';

class EduAppRouter {
  static const splash = "/";
  static const home = "/home";
  static const memoryGame = "/memory_game";

  final GoRouter router = GoRouter(routes: [
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(path: home, builder: (context, state) => const HomePage()),
    GoRoute(
        path: memoryGame, builder: (context, state) => const MemoryGamePage())
  ]);
}
