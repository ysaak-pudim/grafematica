part of 'ui_components.dart';

// === BASE ===
// [box base]
BoxStyler get boxBaseStyle => BoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(10))); // TODO

// [outlined box base]
BoxStyler get outlinedBoxBaseStyle => boxBaseStyle.onBuilder((context) {
  // divider color
  Color dividerColor = Theme.of(context).dividerColor;

  // now using divider color
  return .border(.width(1).color(dividerColor.withAlpha(100)));
});

// [flexbox base]
FlexBoxStyler get flexBoxBaseStyle => FlexBoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(10)))
    .spacing(5); // TODO

FlexBoxStyler get outlinedFlexBoxBaseStyle =>
    flexBoxBaseStyle.onBuilder((context) {
      // divider color
      Color dividerColor = Theme.of(context).dividerColor;

      // now using divider color
      return .border(.width(1).color(dividerColor.withAlpha(100)));
    });

// [button base]
BoxStyler get buttonBaseStyle =>
    boxBaseStyle.animate(.easeIn(100.ms)); // TODO