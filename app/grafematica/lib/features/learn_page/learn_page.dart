import 'package:grafematica/resources/style/ui_components/ui_components.dart';
import 'package:grafematica/resources/subject/subject.dart';
import 'package:material_ui/material_ui.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: column(
        children: [
          SubjectWidget.listItem(
            subject: .new(
              name: "Fermat's Little Theorem",
              level: .intermediate,
              dependencies: [
                .new(level: .intermediate),
                .new(level: .intermediate),
                .new(level: .beginner),
                .new(level: .unrated)
              ]
            ),
          ),
        ],
      ),
    );
  }
}
