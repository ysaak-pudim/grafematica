part of 'app.dart';

class Homepage extends SignalWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: column.width(.maxFinite).height(.maxFinite)(
        children: [
          HomeRichHeaderBar(),
          HomeNavigationOptionWidget(
            title: "Learn",
            icon: fluent_ui.FluentIcons.insights,
            description: "Learn all you want step by step.",
            onPress: () => changeNavigationIndexTo(1),
          ),
          HomeNavigationOptionWidget(
            title: "Graph View",
            icon: fluent_ui.FluentIcons.charticulator_linking_data,
            onPress: () => changeNavigationIndexTo(2),
          ),
          HomeNavigationOptionWidget(
            title: "Stats",
            icon: fluent_ui.FluentIcons.charticulator_linking_sequence,
            onPress: () => changeNavigationIndexTo(3),
          ),
        ],
      ),
    );
  }
}

const loremIpsum =
    """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.""";
