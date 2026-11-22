part of 'themes.dart';

class AppTheme {
  ThemeData toThemeData() {
    // TODO
    return ThemeData();
  }
}

/// (DIRTY PART)
/// TODO: IMPROVE THIS AS SOON AS POSSIBLE

final BoxStyler defaultBaseBoxStyle = BoxStyler()
    .padding(.all(7))
    //.margin(.all(7))
    .border(.width(1))
    .borderRadius(.all(.circular(10)));

final FlexBoxStyler defaultBaseFlexBoxStyler = FlexBoxStyler()
    .padding(.all(7))
    .border(.width(1))
    .borderRadius(.all(.circular(10)));

final BoxStyler defaultBaseButtonStyle = defaultBaseBoxStyle
    .animate(.easeInOut(Duration(milliseconds: 50)))
    .onHovered(.scale(1));

/// (DIRTY PART)
