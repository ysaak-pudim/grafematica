part of 'subject.dart';

enum DifficultyLevel {
  beginner,
  intermediate,
  advanced,
  master,
  epic,
  unrated;

  @override
  toString() {
    switch (this) {
      case .unrated:
        return "unrated";
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
    }
  }
}

class Subject {
  String name;
  DifficultyLevel level;
  late final List<Subject> _dependencies;
  late final List<Subject> _dependents;

  final Map<DifficultyLevel, List<Subject>> _dependenciesLevelMap = {
    for (final dl in DifficultyLevel.values) dl: [],
  };
  final Map<DifficultyLevel, List<Subject>> _dependentsLevelMap = {
    for (final dl in DifficultyLevel.values) dl: [],
  };

  Subject({
    this.name = "Subject Name",
    this.level = .unrated,
    List<Subject>? dependencies,
    List<Subject>? dependents,
  }) {
    _dependencies = [...?dependencies];
    _dependents = [...?dependents];

    for (final d in _dependencies) {
      _dependenciesLevelMap[d.level]!.add(d);
    }

    for (final d in _dependents) {
      _dependentsLevelMap[d.level]!.add(d);
    }
  }

  List<Subject> get dependencies => [..._dependencies];
  List<Subject> get dependents => [..._dependents];

  Map<DifficultyLevel, List<Subject>> get dependenciesLevelMap => {
    ..._dependenciesLevelMap,
  };
  Map<DifficultyLevel, List<Subject>> get dependentsLevelMap => {
    ..._dependentsLevelMap,
  };

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
}
