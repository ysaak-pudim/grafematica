
import 'package:grafematica/features/learn_page/learn_page.dart';
import 'package:material_ui/material_ui.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:signals_flutter/signals_flutter.dart';
import 'package:typst_flutter/typst_flutter.dart';
import 'package:mix/mix.dart';

import 'resources/style/style.dart';

part 'app_state.dart';
part 'homepage.dart';
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
              LearnPage(),
              ...List.generate(
                4,
                (i) => Container(),
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
