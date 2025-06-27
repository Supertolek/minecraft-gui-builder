import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_quill/flutter_quill.dart';

import 'package:gui_builder/globals.dart' as globals;
import 'package:gui_builder/widgets/item_display.dart';

class InventoryDisplay extends StatefulWidget {
  const InventoryDisplay({super.key});

  @override
  State<StatefulWidget> createState() => InventoryDisplayState();
}

class InventoryDisplayState extends State<InventoryDisplay> {
  List<String> blocks = List<String>.filled(27, "air");

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use the smaller of width or height for scaling
        final imageScale = min(
          constraints.maxWidth / globals.chestGuiImage.width,
          constraints.maxHeight / globals.chestGuiImage.height,
        );
        //
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/chest_gui.png"),
              fit: BoxFit.contain,
              filterQuality: FilterQuality.none,
            ),
          ),
          width: globals.chestGuiImage.width * imageScale,
          height: globals.chestGuiImage.height * imageScale,
          alignment: Alignment.center,
          child: GridView.count(
            padding: EdgeInsets.fromLTRB(
              (7 + 1) * imageScale,
              (17 + 1) * imageScale,
              (7 + 1) * imageScale,
              (7 + 1) * imageScale,
            ),
            crossAxisCount: 9,
            crossAxisSpacing: 2 * imageScale,
            mainAxisSpacing: 2 * imageScale,
            children: List.generate(
              blocks.length,
              (int index) => ItemDisplay(itemId: blocks[index]),
            ),
          ),
        );
      },
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MenuBar(
                    children: [
                      SubmenuButton(
                        menuChildren: [
                          MenuItemButton(
                            child: const MenuAcceleratorLabel("item"),
                          ),
                        ],
                        child: const MenuAcceleratorLabel("label"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InventoryDisplay(),
          ],
        ),
      ),
    );
  }
}
