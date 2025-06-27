import 'dart:math' show min;
import 'package:flutter/material.dart';
import 'package:gui_builder/globals.dart' as globals;
import 'package:gui_builder/widgets/item_display.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
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
                children: [
                  ItemDisplay(itemId: "glass_pane"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "dirt"),
                  ItemDisplay(itemId: "white_stained_glass_pane"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
