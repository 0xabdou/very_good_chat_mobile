import 'package:flutter/material.dart';

/// A class that holds screen size configs and helps with responsiveness
class SizeConfig {
  /// Private constructor
  SizeConfig._(
    this._screenSize,
    this._heightUnit,
    this._widthUnit,
  );

  /// Public factory
  factory SizeConfig(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizeConfig._(
      size,
      size.height / 100,
      size.width / 100,
    );
  }

  final Size _screenSize;
  final double _widthUnit;
  final double _heightUnit;

  /// Get a percentage of the total width of the screen
  double width(double percent) => _widthUnit * percent;

  /// Get a percentage of the total height of the screen
  double height(double percent) => _heightUnit * percent;

  /// True if the screen is landscape
  bool get isLandscape => _screenSize.width > _screenSize.height;

  /// True if the screen is portrait
  bool get isPortrait => _screenSize.width < _screenSize.height;

  @override
  String toString() {
    return 'SizeConfigData(width: ${_screenSize.width}, '
        'height: ${_screenSize.height})';
  }

  @override
  bool operator ==(Object other) {
    return other is SizeConfig && other._screenSize == _screenSize;
  }

  @override
  int get hashCode => _screenSize.hashCode;
}
