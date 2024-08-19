import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension AspectRationImage on Image {
  Widget withAspectRatio({
    required BuildContext context,
    double withFactor = 0.6,
    double aspectRatio = 1.0,
    BoxFit fit = BoxFit.contain,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * withFactor;

    return SizedBox(
        width: imageWidth,
        child: AspectRatio(aspectRatio: aspectRatio, child: this));
  }

  Widget withAspectRatioCalculated({
    required BuildContext context,
    required double originalWidth,
    required double originalHeight,
    double withFactor = 0.6,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * withFactor;
    final aspectRatio = originalWidth / originalHeight;
    return SizedBox(
        width: imageWidth,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: this,
        ));
  }
}

extension AspectRationSvg on SvgPicture {
  Widget withAspectRatio({
    required BuildContext context,
    double withFactor = 0.6,
    double aspectRatio = 1.0,
    BoxFit fit = BoxFit.contain,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * withFactor;

    return SizedBox(
        width: imageWidth,
        child: AspectRatio(aspectRatio: aspectRatio, child: this));
  }

  Widget withAspectRatioCalculated({
    required BuildContext context,
    required double originalWidth,
    required double originalHeight,
    double withFactor = 0.6,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * withFactor;
    final aspectRatio = originalWidth / originalHeight;
    return SizedBox(
        width: imageWidth,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: this,
        ));
  }
}
