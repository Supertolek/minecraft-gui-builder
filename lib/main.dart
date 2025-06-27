import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

import 'package:gui_builder/globals.dart' as globals;
import 'package:gui_builder/widgets/datapack_editor.dart' show EditorView;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle("Minecraft Gui Builder");
  });

  final data = await rootBundle.load('assets/chest_gui.png');
  globals.chestGuiImage = await decodeImageFromList(data.buffer.asUint8List());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EditorView();
  }
}
