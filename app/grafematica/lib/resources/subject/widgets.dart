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
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [subjectLevelWidget(), subjectDependenciesWidget()],
              ),
            ],
          ),
    );
  }

  SubjectWidget.richGraphNode({super.key, required this._subject}) {}

  SubjectWidget.graphNode({super.key, required this._subject}) {}

  SubjectWidget.mention({super.key, required this._subject}) {}

  static Color colorByLevel(DifficultyLevel level) => switch (level) {
    .beginner => Colors.green,
    .intermediate => Colors.blue,
    .advanced => Colors.deepOrange,
    .master => Colors.black,
    .epic => Colors.deepPurple,
    .unrated => Colors.grey.withAlpha(130),
  };

  String get levelName => _subject.level.toString();
  Color get levelColor => colorByLevel(_subject.level);

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

  Widget subjectLevelWidget() => outlinedRow
      .padding(.vertical(3).horizontal(5))
      .mainAxisSize(.min)
      .crossAxisAlignment(
        .center,
      )(children: <Widget>[levelCircleWidget(levelColor), greyText.fontSize(12.5)(levelName)]);

  Widget subjectDependenciesWidget() {
    List<({DifficultyLevel level, int quantity})>
    orderedDependenciesQuantitiesList = [];

    for (final dl in <DifficultyLevel>[
      .unrated,
      .beginner,
      .intermediate,
      .advanced,
      .master,
      .epic,
    ]) {
      // temporary dependencies list
      final tempDepList = _subject.dependenciesLevelMap[dl]!;

      // if that list is not empty, then adds it to orderedDependenciesQuantitiesList as quantity
      if (tempDepList.isNotEmpty) {
        orderedDependenciesQuantitiesList.add((
          level: dl,
          quantity: tempDepList.length,
        ));
      }
    }

    return outlinedRow.padding(.all(5)).mainAxisSize(.min)(
      children: [
        for (final pair in orderedDependenciesQuantitiesList)
          Row(
            children: [
              levelCircleWidget(colorByLevel(pair.level)),
              greyText.fontSize(10)(' ${pair.quantity}'),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget;
  }
}
