part of 'app.dart';

class AppNavigationBarWidget extends StatelessWidget {
  AppNavigationBarWidget({super.key});

  final _divider = LayoutBuilder(
    builder: (context, _) =>
        Container(width: 1, height: 20, color: Theme.of(context).dividerColor),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constraints) =>
            row
                .merge(outlinedFlexBoxBaseStyle)
                //.maxWidth(250 + constraints.maxWidth / 12)
                .mainAxisAlignment(.center)
                .mainAxisSize(.min)
                .margin(.bottom(15))(
              children: [
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
              ],
            ),
      ),
    );
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

    return iconButton(
      Icon(
        icon ?? Icons.question_mark,
        color: index == navigationDestinationIndex.value
            ? iconColor
            : dividerColor,
      ),
      onPress: () => changeNavigationIndexTo(index),
    );
  }
}

class HomeNavigationOptionWidget extends SignalWidget {
  const HomeNavigationOptionWidget({
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

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    return outlinedButton(
      onPress: onPress,
      child: column(
        children: [
          row.mainAxisAlignment(.spaceBetween)(
            children: [
              Text(title, textScaler: .linear(1.4)),
              Icon(
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
