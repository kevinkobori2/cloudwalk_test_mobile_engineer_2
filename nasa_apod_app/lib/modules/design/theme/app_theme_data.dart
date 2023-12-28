library app_theme_data;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'data/app_colors_data.dart';
part 'data/app_durations_data.dart';
part 'data/app_icons_data.dart';
part 'data/app_images_data.dart';
part 'data/app_radius_data.dart';
part 'data/app_shadows_data.dart';
part 'data/app_spacings_data.dart';

class AppThemeData {
  final AppIconsData icons;
  final AppPaletteColorsData palleteColors;
  final AppRadiusData radius;
  final AppSpacingsData spacings;
  final AppShadowsData shadows;
  final AppDurationsData durations;
  final AppImagesData images;

  const AppThemeData({
    required this.icons,
    required this.palleteColors,
    // required this.typographies,
    required this.radius,
    required this.spacings,
    required this.shadows,
    required this.durations,
    required this.images,
  });

  factory AppThemeData.standard() => AppThemeData(
        icons: AppIconsData._standard(),
        // typographies: AppTypographiesData._standard(),
        palleteColors: AppPaletteColorsData(),
        radius: AppRadiusData._standard(),
        spacings: AppSpacingsData._standard(),
        shadows: AppShadowsData._standard(),
        durations: AppDurationsData._standard(),
        images: AppImagesData._standard(),
      );
}