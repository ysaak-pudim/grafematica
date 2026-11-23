part of 'ui_components.dart';

// text base
TextStyler get textBaseStyle => TextStyler();

// box base
BoxStyler get boxBaseStyle =>
    BoxStyler().padding(.all(10)).borderRadius(.all(.circular(10)));

// outlined box base
BoxStyler get outlinedBoxBaseStyle => boxBaseStyle.onBuilder((context) {
  Color dividerColor = Theme.of(context).dividerColor;
  return .border(.width(1).color(dividerColor));
});

// flexbox base
FlexBoxStyler get flexBoxBaseStyle => FlexBoxStyler()
    .padding(.all(10))
    .borderRadius(.all(.circular(10)))
    .spacing(10);

// outlined flexbox base
FlexBoxStyler get outlinedFlexBoxBaseStyle =>
    flexBoxBaseStyle.onBuilder((context) {
      Color dividerColor = Theme.of(context).dividerColor;
      return .border(.width(1).color(dividerColor));
    });

// button base
BoxStyler get buttonBaseStyle => boxBaseStyle.animate(.easeIn(100.ms));
