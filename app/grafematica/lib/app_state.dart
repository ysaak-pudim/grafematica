part of 'app.dart';

final compilerIsReady = signal(false);

final navigationDestinationIndex = signal(0);

void changeNavigationIndexTo(int index) {
    navigationDestinationIndex.value = index;
  }