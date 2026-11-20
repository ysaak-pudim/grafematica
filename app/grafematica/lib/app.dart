import 'package:material_ui/material_ui.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:grafematica/features/themes/themes.dart';
import 'package:mix/mix.dart';
import 'package:mix_winds/mix_winds.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:typst_flutter/typst_flutter.dart';

part '_app_state.dart';
part '_widgets.dart';
part 'homepage.dart';

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
        body: SizedBox(
          width: .maxFinite,
          height: .maxFinite,
          child: Stack(
            children: [
              // TODO: implement navigator and container
              [Homepage()][0],
              SafeArea(
                child: Align(
                  alignment: .bottomCenter,
                  child: AppNavigationBarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void initCompiler() async {
  typstCompiler = await TypstCompiler.create();
  compilerIsReady.value = true;
}
