import 'package:edu_app/domain/repositories/image_ext.dart';
import 'package:edu_app/presentation/features/splash/cubit/splash_cubit.dart';
import 'package:edu_app/presentation/router/router.dart';
import 'package:edu_app/presentation/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    splashCubit.startProgress();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.backgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset("assets/splash_logo.svg")
                  .withAspectRatioCalculated(
                      context: context,
                      withFactor: 0.3,
                      originalHeight: 136,
                      originalWidth: 120),
              const SizedBox(
                height: 35,
              ),
              Text(
                AppLocalizations.of(context)!.appTitle,
                style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.splashCraft,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<SplashCubit, LoadingState>(
                builder: (context, state) {
                  if (state.progress == 100) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.go('/home');
                    });
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 43),
                    child: _gradientHorizontalLoader(state.progress),
                  );
                },
              ),
              const SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _gradientHorizontalLoader(int progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 20,
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Stack(
          children: [
            Positioned.fill(
                child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress / 100,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                        colors: AppColors.blueGradientColors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft)
                    .createShader(bounds),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
