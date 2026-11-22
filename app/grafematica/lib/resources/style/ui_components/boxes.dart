part of 'ui_components.dart';

// === BOXES ===
// [box]
BoxStyler get box => boxBaseStyle;

// [outlined]
Widget outlinedBox({Widget? child}) => Box(
  style: boxBaseStyle.onBuilder((context) {
    // divider color
    Color dividerColor = Theme.of(context).dividerColor;

    // now using divider color
    return .border(.color(dividerColor.withAlpha(100)));
  }),
  child: child,
);

// [row & column]
FlexBoxStyler get row => flexBoxBaseStyle.direction(.horizontal);
FlexBoxStyler get column => flexBoxBaseStyle.direction(.vertical);
