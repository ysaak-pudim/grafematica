part of 'subject.dart';

class SubjectWidget extends StatelessWidget {
  final Subject _subject;
  late final Widget Function(Subject) skeleton;

  SubjectWidget.asListItem({super.key, required this._subject}) {
    // TODO
    skeleton = (subject) => LayoutBuilder(
      builder: (context, constraints) => Box(
        style: _boxBaseStyle(context).maxWidth(400).maxHeight(100),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [Text(subject.name), Text(subject.level.toString())],
            ),
          ],
        ),
      ),
    );
  }

  SubjectWidget.asRichGraphNode({super.key, required this._subject}) {
    // TODO
    skeleton = (subject) => LayoutBuilder(
      builder: (context, constraints) => Box(
        style: _boxBaseStyle(context).maxWidth(400).maxHeight(100),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [Text(subject.name), Text(subject.level.toString())],
            ),
          ],
        ),
      ),
    );
  }

  SubjectWidget.asGraphNode({super.key, required this._subject}) {
    // TODO
    skeleton = (subject) => LayoutBuilder(
      builder: (context, constraints) => Box(
        style: _boxBaseStyle(context).maxWidth(400).maxHeight(100),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [Text(subject.name), Text(subject.level.toString())],
            ),
          ],
        ),
      ),
    );
  }

  SubjectWidget.asMention({super.key, required this._subject}) {
    // TODO
    skeleton = (subject) => LayoutBuilder(
      builder: (context, constraints) => Box(
        style: _boxBaseStyle(context).maxWidth(400).maxHeight(100),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [Text(subject.name), Text(subject.level.toString())],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return skeleton(_subject);
  }
}

BoxStyler _boxBaseStyle(BuildContext context) => BoxStyler()
    .border(.width(2).color(MixColors.grey.withAlpha(170)))
    .color(FluentTheme.of(context).cardColor)
    .animate(.easeInOut(Duration(milliseconds: 90)));
