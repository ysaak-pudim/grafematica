part of 'app.dart';

// - BASE -
// box base
BoxStyler get _boxBaseStyle => BoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(5))); // TODO
// flexbox base
FlexBoxStyler get _flexBoxBaseStyle => FlexBoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(5)))
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
        .border(.width(2).color(Theme.of(context).dividerColor))
        .onHovered(
          .border(.color(Theme.of(context).dividerColor.withAlpha(30))),
        ),
    onPress: onPress,
    child: child,
  ),
);

// - BOXES -
BoxStyler get box => _boxBaseStyle;
BoxStyler get outlinedBox => _boxBaseStyle;

// row & column
FlexBoxStyler get row => _flexBoxBaseStyle.direction(.horizontal);
FlexBoxStyler get column => _flexBoxBaseStyle.direction(.vertical);

// card
