part of 'app.dart';

class Homepage extends SignalWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return div('flex-col w-screen h-screen p-5 gap-5', [
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
    ]);
  }
}

const loremIpsum =
    """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.""";

class HomeNavigationOptionWidget extends SignalWidget {
  HomeNavigationOptionWidget({
    super.key,
    this.title = "Title",
    this.icon,
    this.description,
    this.onPress,
  });

  final String title;
  final IconData? icon;
  final String? description;
  final VoidCallback? onPress;

  /// DIRTY PART!!
  /// TODO: reference the style by a file
  final _style = BoxStyler()
      //.color(Colors.black)
      .padding(.all(18))
      .border(.color(Colors.grey).width(2))
      .borderRadius(.all(.circular(10)))
      .minHeight(100)
      .animate(.easeInOut(Duration(milliseconds: 50)))
      .onPressed(.scale(1.02));

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    return PressableBox(
      style: _style,
      onPress: onPress,
      child: Column(
        spacing: 20,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(title, textScaler: .linear(1.4)),
              fluent_ui.WindowsIcon(
                icon ?? fluent_ui.FluentIcons.app_icon_default,
                color: iconColor,
                size: 30,
              ),
            ],
          ),
          Text(description ?? loremIpsum),
        ],
      ),
    );
  }
}
