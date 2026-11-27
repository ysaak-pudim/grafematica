part of 'app.dart';

class HomeRichHeaderBar extends StatelessWidget {
  const HomeRichHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return row.mainAxisAlignment(.spaceBetween)(
      children: [
        outlinedRow(
          children: [
            CircleAvatar(),
            column.spacing(0).crossAxisAlignment(.start)(
              children: [h4('User Name'), greyText('@username')],
            ),
          ],
        ),
      ],
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
      child: column.crossAxisAlignment(.start)(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              h3(title),
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

class AppNavigationBarWidget extends StatelessWidget {
  AppNavigationBarWidget({super.key});

  final _divider = BoxStyler()
      .width(1.5)
      .height(30)
      .onBuilder(
        (context) => .color(
          Theme.of(context).dividerColor
              .lerpWith(Theme.of(context).scaffoldBackgroundColor, 0.3),
        ),
      )();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constraints) =>
            outlinedRow
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
            : iconColor?.withAlpha(140),
      ),
      onPress: () => changeNavigationIndexTo(index),
    );
  }
}
