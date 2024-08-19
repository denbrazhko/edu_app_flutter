import 'package:edu_app/presentation/features/splash/cubit/splash_cubit.dart';
import 'package:edu_app/presentation/router/router.dart';
import 'package:edu_app/presentation/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SplashCubit())],
      child: EduApp()));
}

class EduApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: AppTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: EduAppRouter().router,
        title: "Education App");
  }
}
