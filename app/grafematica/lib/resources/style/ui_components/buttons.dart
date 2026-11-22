part of 'ui_components.dart';

// === BUTTONS ===
// [primary]
Widget primaryButton({required Widget child, required VoidCallback? onPress}) =>
    PressableBox(
      style: buttonBaseStyle,
      onPress: onPress,
      child: child,
    ); // TODO

// [secondary]
Widget secondaryButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(
  style: buttonBaseStyle,
  onPress: onPress,
  child: child,
); // TODO

// [outlined]
Widget outlinedButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(
  style: buttonBaseStyle.onBuilder((context) {
    // divider color
    Color dividerColor = Theme.of(context).dividerColor;

    // now using divider color
    return BoxStyler()
        .merge(outlinedBoxBaseStyle)
        .onHovered(.border(.color(dividerColor.withAlpha(70))));
  }),
  onPress: onPress,
  child: child,
);

// [icon button]
Widget iconButton(Icon icon, {VoidCallback? onPress}) {
  return PressableBox(
    style: buttonBaseStyle.onBuilder((context) {
      // colors
      Color hoverColor = Theme.of(context).hoverColor;
      Color bgColor = Theme.of(context).scaffoldBackgroundColor;

      // now using colors
      return .color(bgColor).onHovered(.color(hoverColor));
    }),
    onPress: onPress,
    child: icon,
  );
}