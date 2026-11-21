part of 'app.dart';

class AppNavigationBarWidget extends StatelessWidget {
  AppNavigationBarWidget({super.key});

  final _divider = LayoutBuilder(
    builder: (context, _) =>
        Container(width: 1, height: 20, color: Theme.of(context).dividerColor),
  );

  @override
  Widget build(BuildContext context) {
    return div('w-screen h-screen flex-col items-center justify-end p-5', [
      LayoutBuilder(
        builder: (context, constraints) => Box(
          // Style based on appstyle + screen constraints
          style: defaultBaseBoxStyle
              .maxWidth(250 + constraints.maxWidth / 10)
              .border(.color(Theme.of(context).iconTheme.color!)),

          child: div('flex-row justify-around gap-3', [
            NavigationDestinationWidget(
              icon: fluent_ui.FluentIcons.home,
              index: 0,
            ),

            _divider,

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

            _divider,

            NavigationDestinationWidget(
              icon: fluent_ui.FluentIcons.settings,
              index: 4,
            ),
          ]),
        ),
      ),
    ]);
  }
}

class NavigationDestinationWidget extends SignalWidget {
  const NavigationDestinationWidget({
    super.key,
    this.icon,
    required this.index,
  });

  final IconData? icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    final dividerColor = Theme.of(context).dividerColor;

    return button('flex p-1', [
      Icon(
        icon ?? Icons.question_mark,
        color: index == navigationDestinationIndex.value
            ? iconColor
            : dividerColor,
      ),
    ], onPressed: () => changeNavigationIndexTo(index));
  }
}
