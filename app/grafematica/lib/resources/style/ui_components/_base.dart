part of 'ui_components.dart';

// box base
BoxStyler get boxBaseStyle => BoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(10)));

// outlined box base
BoxStyler get outlinedBoxBaseStyle => boxBaseStyle.onBuilder((context) {
  Color dividerColor = Theme.of(context).dividerColor;
  return .border(.width(1).color(dividerColor.withAlpha(100)));
});

// flexbox base
FlexBoxStyler get flexBoxBaseStyle => FlexBoxStyler()
    .padding(.all(5))
    .margin(.all(5))
    .borderRadius(.all(.circular(10)))
    .spacing(5);

// outlined flexbox base
FlexBoxStyler get outlinedFlexBoxBaseStyle =>
    flexBoxBaseStyle.onBuilder((context) {
      Color dividerColor = Theme.of(context).dividerColor;
      return .border(.width(1).color(dividerColor.withAlpha(100)));
    });

// button base
BoxStyler get buttonBaseStyle => boxBaseStyle.animate(.easeIn(100.ms));
