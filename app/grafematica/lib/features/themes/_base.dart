part of 'themes.dart';

final BoxStyler defaultBaseBoxStyle = BoxStyler()
    .padding(.all(7))
    //.margin(.all(7))
    .border(.width(1))
    .borderRadius(.all(.circular(10)));

final BoxStyler defaultBaseButtonStyle = defaultBaseBoxStyle
    .animate(.easeInOut(Duration(milliseconds: 50)))
    .onHovered(.scale(1));
final FlexBoxStyler defaultBaseFlexBoxStyler = FlexBoxStyler();
