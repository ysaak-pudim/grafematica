part of 'ui_components.dart';

// primary
Widget primaryButton({required Widget child, required VoidCallback? onPress}) =>
    PressableBox(
      style: buttonBaseStyle,
      onPress: onPress,
      child: child,
    );

// secondary
Widget secondaryButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(
  style: buttonBaseStyle,
  onPress: onPress,
  child: child,
);

// outlined
Widget outlinedButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(
  style: buttonBaseStyle.onBuilder((context) {
    Color dividerColor = Theme.of(context).dividerColor;
    return BoxStyler()
        .merge(outlinedBoxBaseStyle)
        .onHovered(.border(.color(dividerColor.withAlpha(70))));
  }),
  onPress: onPress,
  child: child,
);

// icon
Widget iconButton(Icon icon, {VoidCallback? onPress}) {
  return PressableBox(
    style: buttonBaseStyle.onBuilder((context) {
      Color hoverColor = Theme.of(context).hoverColor;
      Color bgColor = Theme.of(context).scaffoldBackgroundColor;
      return .color(bgColor).onHovered(.color(hoverColor));
    }),
    onPress: onPress,
    child: icon,
  );
}