import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';
import 'package:signals_flutter/signals_flutter.dart';

part 'widgets.dart';

class Homepage extends SignalWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: .symmetric(vertical: 30, horizontal: 30),
      child: Column(
        spacing: 25,
        mainAxisAlignment: .spaceEvenly,
        mainAxisSize: .min,
        children: [
          NavigationOptionWidget(
            title: "Learn",
            icon: FluentIcons.insights,
            description: "Learn all you want step by step.",
          ),
          NavigationOptionWidget(
            title: "Graph View",
            icon: FluentIcons.charticulator_linking_data,
          ),
          NavigationOptionWidget(
            title: "Stats",
            icon: FluentIcons.charticulator_linking_sequence,
          ),
        ],
      ),
    );
  }
}
