part of 'app.dart';

class AppNavigationBarWidget extends StatelessWidget {
  const AppNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return div('w-screen h-screen flex-col items-center justify-end p-5', [
      LayoutBuilder(
        builder: (_, constraints) => Box(
          style: defaultBaseBoxStyle
              .maxWidth(250 + constraints.maxWidth / 10)
              .border(.color(Theme.of(context).iconTheme.color!)),
          child: div('flex-row justify-center gap-3',[
              NavigationDestinationWidget(
                icon: fluent_ui.FluentIcons.home,
                index: 0,
              ),
              Container(
                width: 1,
                height: 20,
                color: Theme.of(context).dividerColor,
              ),
              NavigationDestinationWidget(
                icon: fluent_ui.FluentIcons.insights,
                index: 1,
              ),
              NavigationDestinationWidget(
                icon: fluent_ui.FluentIcons.charticulator_linking_data,
                index: 2,
              ),
              NavigationDestinationWidget(
                icon: fluent_ui.FluentIcons.charticulator_linking_sequence,
                index: 3,
              ),
              Container(
                width: 1,
                height: 20,
                color: Theme.of(context).dividerColor,
              ),
              NavigationDestinationWidget(
                icon: fluent_ui.FluentIcons.settings,
                index: 4,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class NavigationDestinationWidget extends SignalWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  final int index;

  const NavigationDestinationWidget({
    super.key,
    this.icon,
    required this.index,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: BoxStyler().padding(.all(3)),
      onPress: () {
        (onPress ?? () {})();
        changeNavigationIndexTo(index);
      },
      child: Icon(
        icon ?? Icons.question_mark,
        color: navigationDestinationIndex.value == index
            ? Theme.of(context).iconTheme.color
            : Theme.of(context).dividerColor,
      ),
    );
  }
}
