part of 'homepage.dart';

const loremIpsum =
    """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.""";

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
      .onPressed(.scale(1.02));

  @override
  Widget build(BuildContext context) {
    final activeColor = FluentTheme.of(context).activeColor;
    return Box(
      style: _style,
      child: Column(
        spacing: 20,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(title, textScaler: .linear(1.4)),
              WindowsIcon(
                icon ?? FluentIcons.fluid_logo,
                color: activeColor,
                size: 30,
              ),
            ],
          ),
          Text(description ?? loremIpsum),
        ],
      ),
    );
  }
}
