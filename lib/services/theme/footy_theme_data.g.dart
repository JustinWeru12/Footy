// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footy_theme_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FootballThemeData _$FootballThemeDataFromJson(Map<String, dynamic> json) =>
    FootballThemeData(
      name: json['name'] as String,
      backgroundColors: (json['backgroundColors'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      primaryColor: json['primaryColor'] as int,
      secondaryColor: json['secondaryColor'] as int,
      cardColor: json['cardColor'] as int,
      statusBarColor: json['statusBarColor'] as int,
      navBarColor: json['navBarColor'] as int,
    );

Map<String, dynamic> _$FootballThemeDataToJson(FootballThemeData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'backgroundColors': instance.backgroundColors,
      'primaryColor': instance.primaryColor,
      'secondaryColor': instance.secondaryColor,
      'cardColor': instance.cardColor,
      'statusBarColor': instance.statusBarColor,
      'navBarColor': instance.navBarColor,
    };
