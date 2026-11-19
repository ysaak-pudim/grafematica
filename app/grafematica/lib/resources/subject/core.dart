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
  String name;
  DifficultyLevel level;
  late final List<Subject> _dependencies;
  late final List<Subject> _dependents;

  Subject({
    this.name = "Subject Name",
    this.level = .unrated,
    List<Subject>? dependencies,
    List<Subject>? dependents,
  }) {
    _dependencies = [...?dependencies];
    _dependents = [...?dependents];
  }

  List<Subject> get dependencies => [..._dependencies];
  List<Subject> get dependents => [..._dependents];

  void addDependency(Subject dependency) {
    if (dependency == this) return;
    _dependencies.add(dependency);
  }

  void addDependencies(List<Subject> dependencies) {
    _dependencies.addAll(dependencies.where((d) => d != this));
  }

  void addDependent(Subject dependent) {
    if (dependent == this) return;
    _dependents.add(dependent);
  }

  void addDependents(List<Subject> dependents) {
    if (dependents.contains(this)) return;
    _dependents.addAll(dependents.where((d) => d != this));
  }
}
