part of 'subject.dart';

class SubjectWidget extends StatelessWidget {
  final Subject _subject;
  late final Widget _widget;

  SubjectWidget.listItem({super.key, required this._subject}) {
    _widget = LayoutBuilder(
      builder: (context, constraints) =>
          outlinedColumn.crossAxisAlignment(.start)(
            children: <Widget>[
              subjectTitleWidget(),
              row.mainAxisAlignment(.spaceBetween)(
                children: <Widget>[
                  subjectLevelWidget(),
                  subjectDependenciesWidget(),
                ],
              ),
            ],
          ),
    );
  }

  SubjectWidget.richGraphNode({super.key, required this._subject}) {}

  SubjectWidget.graphNode({super.key, required this._subject}) {}

  SubjectWidget.mention({super.key, required this._subject}) {}

  String get levelName => _subject.level.toString();
  Color get levelColor => switch (_subject.level) {
    .beginner => Colors.green,
    .intermediate => Colors.blue,
    .advanced => Colors.deepOrange,
    .master => Colors.black,
    .epic => Colors.deepPurple,
    .unrated => Colors.grey.withAlpha(130),
  };

  Widget levelCircleWidget(Color levelColor) => LayoutBuilder(
    builder: (context, _) => CircleAvatar(
      // simulate an outline around the colored circle
      backgroundColor: Theme.of(context).dividerColor,
      radius: 5,

      // colored circle to indicate the subject level
      child: CircleAvatar(backgroundColor: levelColor, radius: 4),
    ),
  );

  Widget subjectTitleWidget() => box(child: h3(_subject.name));
  Widget subjectLevelWidget() => outlinedRow.mainAxisSize(.min)(
    children: <Widget>[levelCircleWidget(levelColor), greyText(levelName)],
  );
  Widget subjectDependenciesWidget() => Container();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget;
  }
}
