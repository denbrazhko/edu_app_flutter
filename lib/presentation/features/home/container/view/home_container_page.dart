import 'package:edu_app/generated/assets.dart';
import 'package:edu_app/main.dart';
import 'package:edu_app/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeContainerPage extends StatelessWidget {
  final Widget child;

  const HomeContainerPage(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: child,
          bottomNavigationBar: _bottomNav(context),
        ));
  }

  Widget _bottomNav(BuildContext context) {
    final AppLocalizations s = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 15,
              blurRadius: 15,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateCurrentIndex(context),
          onTap: (index) {
            switch (index) {
              case 0:
                context.go(EduAppRouter.statistics);
                break;
              case 1:
                context.go(EduAppRouter.home);
                break;
              case 2:
                context.go(EduAppRouter.settings);
                break;
            }
          },
          selectedLabelStyle: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: AppColors.homeNavBarActivePrimary),
          selectedItemColor: AppColors.homeNavBarActivePrimary,
          unselectedItemColor: AppColors.homeNavBarInactivePrimary,
          unselectedLabelStyle: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: AppColors.homeNavBarInactivePrimary),
          items: [
            _getNavBarItem(s.statistics, Assets.assetsStatistics),
            _getNavBarItem(s.allGames, Assets.assetsAllGames),
            _getNavBarItem(s.settings, Assets.assetsSettings)
          ],
        ),
      ),
    );
  }

  int _calculateCurrentIndex(BuildContext context) {
    String location = GoRouterState.of(context).uri.toString();
    if (location.contains(EduAppRouter.home)) {
      return 1;
    }
    if (location.contains(EduAppRouter.settings)) {
      return 2;
    }
    if (location.contains(EduAppRouter.statistics)) {
      return 0;
    }
    return 1;
  }

  BottomNavigationBarItem _getNavBarItem(String title, String icon) {
    return BottomNavigationBarItem(
        icon: Container(
          margin: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
                AppColors.homeNavBarInactivePrimary, BlendMode.srcIn),
          ),
        ),
        activeIcon: DecoratedBox(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.homeNavBarActivePrimary),
            child: Container(
              margin: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(
                    AppColors.homeNavBarActiveSecondary, BlendMode.srcIn),
              ),
            )),
        label: title);
  }
}
