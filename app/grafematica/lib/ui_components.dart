part of 'app.dart';

// - BASE -
// box base
BoxStyler get _boxBaseStyle => BoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(10))); // TODO
// flexbox base
FlexBoxStyler get _flexBoxBaseStyle => FlexBoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(10)))
    .spacing(5); // TODO
// button base
BoxStyler get _buttonBaseStyle => _boxBaseStyle; // TODO

// - BUTTONS -
// primary
Widget primaryButton({required Widget child, required VoidCallback? onPress}) =>
    PressableBox(
      style: _buttonBaseStyle,
      onPress: onPress,
      child: child,
    ); // TODO
// secondary
Widget secondaryButton({
  required Widget child,
  required VoidCallback? onPress,
}) => PressableBox(
  style: _buttonBaseStyle,
  onPress: onPress,
  child: child,
); // TODO
// outlined
Widget outlinedButton({
  required Widget child,
  required VoidCallback? onPress,
}) => LayoutBuilder(
  builder: (context, _) => PressableBox(
    style: _buttonBaseStyle
        .border(.width(2).color(Theme.of(context).dividerColor.withAlpha(100)))
        .onHovered(
          .border(.color(Theme.of(context).dividerColor.withAlpha(70))),
        ),
    onPress: onPress,
    child: child,
  ),
);
// icon button
Widget iconButton(Icon icon, {VoidCallback? onPress}) {
  return PressableBox(style: _buttonBaseStyle, onPress: onPress, child: icon);
}

// - BOXES -
BoxStyler get box => _boxBaseStyle;
Widget outlinedBox({Widget? child}) => LayoutBuilder(
  builder: (context, _) => Box(
    style: _boxBaseStyle.border(
      .color(Theme.of(context).dividerColor.withAlpha(100)),
    ),
    child: child,
  ),
);

// row & column
FlexBoxStyler get row => _flexBoxBaseStyle.direction(.horizontal);
FlexBoxStyler get column => _flexBoxBaseStyle.direction(.vertical);

// card
