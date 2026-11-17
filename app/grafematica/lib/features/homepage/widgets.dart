part of 'homepage.dart';

final _textBaseStyle = TextStyler().color(MixColors.grey);

class NavigationOptionWidget extends SignalWidget {
  NavigationOptionWidget({
    super.key,
    this.title = "Title",
    this.icon,
    this.description,
  });

  final String title;
  final IconData? icon;
  final String? description;

  final _style = BoxStyler()
      .color(Colors.black)
      .padding(.all(18))
      .border(.color(Colors.grey).width(2))
      .borderRadius(.all(.circular(10)))
      .minHeight(100)
      .animate(.easeInOut(Duration(milliseconds: 50)))
      .onPressed(.scale(1.05));

  final _titleStyle = _textBaseStyle.color(MixColors.grey).fontWeight(.bold).textScaler(.linear(1.25));

  final _descriptionStyle = _textBaseStyle.color(MixColors.greySwatch);

  @override
  Widget build(BuildContext context) {
    final activeColor = FluentTheme.of(context).activeColor;
    return Box(
      style: _style,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              StyledText(
                title,
                style: _titleStyle,
              ),
              WindowsIcon(
                icon ?? FluentIcons.fluid_logo,
                color: activeColor,
                size: 30,
              ),
            ],
          ),
          StyledText(
            description ?? "Lorem ipsum ... ... .. ..",
            style: _descriptionStyle,
          ),
        ],
      ),
    );
  }
}
