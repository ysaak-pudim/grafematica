part of 'subject.dart';

enum DifficultyLevel {
  beginner,
  intermediate,
  advanced,
  master,
  epic,
  unrated;

  static List<DifficultyLevel> get orderedDifficulties => [
    .beginner,
    .intermediate,
    .advanced,
    .master,
    .epic,
    .unrated,
  ];

  @override
  toString() {
    switch (this) {
      case .beginner:
        return "beginner";
      case .intermediate:
        return "intermediate";
      case .advanced:
        return "advanced";
      case .master:
        return "master";
      case .epic:
        return "epic";
      case .unrated:
        return "unrated";
    }
  }
}

class Subject {
  /// Subject name
  String name;

  /// Subject level
  DifficultyLevel level;

  /// Subject description
  String? description;

  /// Subject ID
  ///
  /// It must be unique
  late final String id;

  /// Subject dependencies
  late final List<Subject> _dependencies;

  /// Dependents of this subject
  late final List<Subject> _dependents;

  final Map<DifficultyLevel, List<Subject>> _dependenciesLevelMap = {
    for (final dl in DifficultyLevel.values) dl: [],
  };
  final Map<DifficultyLevel, List<Subject>> _dependentsLevelMap = {
    for (final dl in DifficultyLevel.values) dl: [],
  };

  /// Subject class.
  /// 
  /// It is used for creating a subject in a friendly way, for testing or other purposes.
  Subject({
    this.name = "Subject Name",
    String? id,
    this.level = .unrated,
    this.description,
    List<Subject>? dependencies,
    List<Subject>? dependents,
  }) {
    this.id = id ?? "generated-id-$_getNewID";

    _dependencies = [...?dependencies];
    _dependents = [...?dependents];

    for (final d in _dependencies) {
      _dependenciesLevelMap[d.level]!.add(d);
    }

    for (final d in _dependents) {
      _dependentsLevelMap[d.level]!.add(d);
    }
  }

  Subject.raw({
    required String name,
    required String id,
    required DifficultyLevel level,
    required String description,
    required List<Subject> dependencies,
    required List<Subject> dependents,
  }) : this(
         name: name,
         id: id,
         level: level,
         description: description,
         dependencies: dependencies,
         dependents: dependents,
       );

  factory Subject.fromJson(String jsonContent) {
    return Subject();
  }

  /// Returns a list of all its dependencies
  List<Subject> get dependencies => [..._dependencies];

  /// Returns a list of all subjects that depends on it
  List<Subject> get dependents => [..._dependents];

  /// Returns its dependencies separated by level
  Map<DifficultyLevel, List<Subject>> get dependenciesLevelMap => {
    ..._dependenciesLevelMap,
  };

  /// Returns its dependents separated by level
  Map<DifficultyLevel, List<Subject>> get dependentsLevelMap => {
    ..._dependentsLevelMap,
  };

  /// Returns a list of dependencies ordered by level, from [.unrated] to [.epic]
  List<({DifficultyLevel level, List<Subject> subjects})>
  get orderedDependenciesList {
    return _sortByLevel(_dependenciesLevelMap);
  }

  List<({DifficultyLevel level, List<Subject> subjects})>
  get orderedDependentsList {
    return _sortByLevel(_dependentsLevelMap);
  }

  void addDependency(Subject dependency) {
    if (dependency == this || _dependencies.contains(dependency)) return;
    _dependencies.add(dependency);
    _dependenciesLevelMap[dependency.level]!.add(dependency);
  }

  void addDependencies(List<Subject> dependencies) {
    for (final d in dependencies) {
      if (d == this || _dependencies.contains(d)) continue;
      _dependencies.add(d);
      _dependenciesLevelMap[d.level]!.add(d);
    }
  }

  void addDependent(Subject dependent) {
    if (dependent == this || _dependents.contains(dependent)) return;
    _dependents.add(dependent);
    _dependentsLevelMap[dependent.level]!.add(dependent);
  }

  void addDependents(List<Subject> dependents) {
    for (final d in dependents) {
      if (d == this || _dependents.contains(d)) continue;
      _dependents.add(d);
      _dependentsLevelMap[d.level]!.add(d);
    }
  }

  static List<({DifficultyLevel level, List<Subject> subjects})> _sortByLevel(
    Map<DifficultyLevel, List<Subject>> subjectsMap,
  ) {
    final list = <({DifficultyLevel level, List<Subject> subjects})>[];

    for (final difficultLevel in DifficultyLevel.orderedDifficulties) {
      final currentSubjectList = subjectsMap[difficultLevel]!;

      if (currentSubjectList.isNotEmpty) {
        list.add((level: difficultLevel, subjects: [...currentSubjectList]));
      }
    }

    return list;
  }

  static int _lastID = 0;
  static int get _getNewID {
    int id = _lastID;
    _lastID++;
    return id;
  }

  static Subject getFromID(String id) {
    // TODO
    return Subject();
  }
}
