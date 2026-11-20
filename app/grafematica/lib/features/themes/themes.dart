import 'package:material_ui/material_ui.dart';
import 'package:mix/mix.dart';
import 'package:signals_flutter/signals_flutter.dart';

part '_base.dart';

class AppThemes {
  static final defaultLight = ThemeData(brightness: .light);
  static final defaultDark = ThemeData(brightness: .dark, scaffoldBackgroundColor: Colors.black);
}
