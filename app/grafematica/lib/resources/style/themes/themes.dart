import 'package:material_ui/material_ui.dart';

class AppThemes {
  static final defaultLight = ThemeData(brightness: .light);
  static final defaultDark = ThemeData(
    brightness: .dark,
    dividerColor: const Color.fromARGB(255, 39, 39, 39),
    scaffoldBackgroundColor: Colors.black,
    hoverColor: const Color.fromARGB(255, 29, 29, 29),
    iconTheme: IconThemeData(color: Colors.grey),
    textTheme: TextTheme(displayLarge: TextStyle(fontSize: 25))
  );
}
