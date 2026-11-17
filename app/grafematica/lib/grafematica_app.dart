import 'package:fluent_ui/fluent_ui.dart';
import 'package:mix/mix.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:typst_flutter/typst_flutter.dart';

/// Active compiler for the whole app
late TypstCompiler typstCompiler;
final compilerIsReady = signal(false);

class GrafematicaApp extends SignalWidget {
  GrafematicaApp({super.key}) {
    initCompiler();
  }

  final selectedNavigation = signal("");

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      // Theme part
      theme: FluentThemeData(brightness: .light),
      darkTheme: FluentThemeData(brightness: .dark),

      // App home
      home: Container(
        width: .maxFinite,
        height: .maxFinite,
        padding: .all(5),
        child: Stack(
          children: [
            Center(
              child: FlexBox(
                style: FlexBoxStyler()
                    .mainAxisSize(.min)
                    .direction(.vertical)
                    .padding(.all(20))
                    .color(Colors.black)
                    .shadow(.color(Colors.purple).blurRadius(3))
                    .border(.color(Colors.purple))
                    .borderRadius(.all(.circular(20))),
                children: [
                  Text("This is a container."),
                  Text("You selected: ${selectedNavigation.value}"),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Align(
                  alignment: .bottomCenter,
                  child: Box(
                    style: BoxStyler()
                        .margin(.symmetric(horizontal: 25, vertical: 15))
                        .maxWidth(350 + constraints.maxWidth / 20)
                        .color(Colors.black)
                        .borderRadius(.all(.circular(15)))
                        .border(.color(Colors.purple).width(1))
                        .shadow(.color(Colors.purple).blurRadius(3)),
                    child: CommandBar(
                      mainAxisAlignment: .spaceEvenly,
                      primaryItems: [
                        CommandBarButton(
                          //label: Text("Home"),
                          icon: WindowsIcon(WindowsIcons.home),
                          onPressed: () {
                            selectedNavigation.value = "Home";
                          },
                        ),
                        CommandBarSeparator(),
                        CommandBarButton(
                          icon: WindowsIcon(FluentIcons.insights),
                          onPressed: () {
                            selectedNavigation.value = "Learn";
                          },
                        ),
                        CommandBarButton(
                          //label: Text("Graph View"),
                          icon: WindowsIcon(
                            FluentIcons.charticulator_linking_data,
                          ),
                          onPressed: () {
                            selectedNavigation.value = "Graph View";
                          },
                        ),
                        CommandBarButton(
                          //label: Text("Stats"),
                          icon: WindowsIcon(
                            FluentIcons.charticulator_linking_sequence,
                          ),
                          onPressed: () {
                            selectedNavigation.value = "Stats";
                          },
                        ),
                        CommandBarSeparator(),
                        CommandBarButton(
                          //label: Text("Settings"),
                          icon: WindowsIcon(WindowsIcons.settings),
                          onPressed: () {
                            selectedNavigation.value = "Settings";
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
