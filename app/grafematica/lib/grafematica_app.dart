import 'package:fluent_ui/fluent_ui.dart';
import 'package:grafematica/features/homepage/homepage.dart';
import 'package:mix/mix.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:typst_flutter/typst_flutter.dart';

/// Active compiler for the whole app
late TypstCompiler typstCompiler;
final compilerIsReady = signal(false);

Color primaryColor = Color.fromARGB(255, 160, 0, 255);

class GrafematicaApp extends SignalWidget {
  GrafematicaApp({super.key}) {
    initCompiler();
  }

  final selectedNavigation = signal("");
  final selectedIndex = signal(0);

  Color whiteOrMaybeOther(BuildContext context, int index) {
    if (index == selectedIndex.value) {
      return FluentTheme.of(context).activeColor;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      // Theme part
      theme: FluentThemeData(
        brightness: .light,
        activeColor: Color.fromARGB(255, 160, 0, 255),
      ),
      darkTheme: FluentThemeData(
        brightness: .dark,
        activeColor: Color.fromARGB(255, 160, 0, 255),
      ),

      // App home
      home: Container(
        width: .maxFinite,
        height: .maxFinite,
        padding: .all(5),
        child: Stack(
          children: [
            SafeArea(
              child: <Widget>[
                Homepage(),
                Container(),
                Container(),
                Container(),
                Container(),
              ][selectedIndex.value],
            ),

            Positioned(
              bottom: 200,
              right: 20,
              child: FlexBox(
                style: FlexBoxStyler()
                    .mainAxisSize(.min)
                    .direction(.vertical)
                    .padding(.all(20))
                    .color(Colors.black)
                    .shadow(.color(primaryColor).blurRadius(4))
                    .border(.color(primaryColor))
                    .borderRadius(.all(.circular(20))),
                children: [
                  Text("This is a container."),
                  Text("You selected: ${selectedNavigation.value}"),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (ctx, constraints) {
                return SafeArea(
                  child: Align(
                    alignment: .bottomCenter,
                    child: Box(
                      style: BoxStyler()
                          .margin(.symmetric(horizontal: 25, vertical: 15))
                          .maxWidth(350 + constraints.maxWidth / 20)
                          .color(Colors.black)
                          .borderRadius(.all(.circular(15)))
                          .border(.color(primaryColor).width(1))
                          .shadow(.color(primaryColor).blurRadius(4)),
                      child: CommandBar(
                        mainAxisAlignment: .spaceEvenly,
                        primaryItems: [
                          CommandBarButton(
                            //label: Text("Home"),
                            icon: WindowsIcon(
                              WindowsIcons.home,
                              color: whiteOrMaybeOther(ctx, 0),
                            ),
                            onPressed: () {
                              selectedNavigation.value = "Home";
                              selectedIndex.value = 0;
                            },
                          ),
                          CommandBarSeparator(),
                          CommandBarButton(
                            icon: WindowsIcon(
                              FluentIcons.insights,
                              color: whiteOrMaybeOther(ctx, 1),
                            ),
                            onPressed: () {
                              selectedNavigation.value = "Learn";
                              selectedIndex.value = 1;
                            },
                          ),
                          CommandBarButton(
                            //label: Text("Graph View"),
                            icon: WindowsIcon(
                              FluentIcons.charticulator_linking_data,
                              color: whiteOrMaybeOther(ctx, 2),
                            ),
                            onPressed: () {
                              selectedNavigation.value = "Graph View";
                              selectedIndex.value = 2;
                            },
                          ),
                          CommandBarButton(
                            //label: Text("Stats"),
                            icon: WindowsIcon(
                              FluentIcons.charticulator_linking_sequence,
                              color: whiteOrMaybeOther(ctx, 3),
                            ),
                            onPressed: () {
                              selectedNavigation.value = "Stats";
                              selectedIndex.value = 3;
                            },
                          ),
                          CommandBarSeparator(),
                          CommandBarButton(
                            //label: Text("Settings"),
                            icon: WindowsIcon(
                              WindowsIcons.settings,
                              color: whiteOrMaybeOther(ctx, 4),
                            ),
                            onPressed: () {
                              selectedNavigation.value = "Settings";
                              selectedIndex.value = 4;
                            },
                          ),
                        ],
                      ),
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
