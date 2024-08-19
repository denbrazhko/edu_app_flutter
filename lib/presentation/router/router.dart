import 'package:edu_app/presentation/features/home/home.dart';
import 'package:edu_app/presentation/features/splash/view/splash_page.dart';
import 'package:go_router/go_router.dart';

class EduAppRouter {
  final GoRouter router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashPage()),
    GoRoute(path: "/home", builder: (context, state) => const HomePage())
  ]);
}
