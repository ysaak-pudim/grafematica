part of 'ui_components.dart';

// primary
Widget primaryButton({required Widget child, required VoidCallback? onPress}) =>
    PressableBox(style: buttonBaseStyle, onPress: onPress, child: child);

// secondary
Widget secondaryButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(style: buttonBaseStyle, onPress: onPress, child: child);

// outlined
Widget outlinedButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(
  style: buttonBaseStyle.merge(outlinedBoxBaseStyle).onBuilder((context) {
    final dividerColor = Theme.of(context).dividerColor;
    return BoxStyler().onHovered(.border(.color(dividerColor.withAlpha(150))));
  }),
  onPress: onPress,
  child: child,
);

// icon
Widget iconButton(Icon icon, {VoidCallback? onPress}) {
  return PressableBox(
    style: buttonBaseStyle.onBuilder((context) {
      final hoverColor = Theme.of(context).hoverColor;
      final bgColor = Theme.of(context).scaffoldBackgroundColor;
      return .color(bgColor).onHovered(.color(hoverColor));
    }),
    onPress: onPress,
    child: icon,
  );
}
