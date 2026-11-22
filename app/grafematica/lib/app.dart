import 'package:material_ui/material_ui.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:remix/remix.dart';
import 'package:mix_winds/mix_winds.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:typst_flutter/typst_flutter.dart';

import './features/themes/themes.dart';

part 'app_state.dart';
part 'homepage.dart';
part 'ui_components.dart';
part 'widgets.dart';


/// Active compiler for the whole app
late TypstCompiler typstCompiler;

class GrafematicaApp extends SignalWidget {
  GrafematicaApp({super.key}) {
    initCompiler();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.defaultLight, // TODO: theme management
      darkTheme: AppThemes.defaultDark, // TODO: theme management
      home: Scaffold(
        body: Stack(
          alignment: .bottomCenter,
          children: [
            // TODO: implement navigator and navigation box
            [
              Homepage(),
              ...List.generate(
                4,
                (i) => Center(child: Text('destination ${i + 1}')),
              ),
            ][navigationDestinationIndex.value],
            AppNavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}

void initCompiler() async {
  typstCompiler = await TypstCompiler.create();
  compilerIsReady.value = true;
}
