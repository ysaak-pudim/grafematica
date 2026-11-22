import 'package:material_ui/material_ui.dart';

class AppThemes {
  static final defaultLight = ThemeData(brightness: .light);
  static final defaultDark = ThemeData(
    brightness: .dark,
    scaffoldBackgroundColor: Colors.black,
    hoverColor: const Color.fromARGB(255, 29, 29, 29),
  );
}
