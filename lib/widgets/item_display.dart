import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:gui_builder/utils/items.dart';

class ItemDisplay extends StatefulWidget {
  final String itemId;
  final int itemCount;

  const ItemDisplay({super.key, required this.itemId, this.itemCount = 1});

  @override
  State<ItemDisplay> createState() => _ItemDisplayState();
}

class _ItemDisplayState extends State<ItemDisplay> {
  late Future<Uint8List> _textureFuture;

  @override
  void initState() {
    super.initState();
    _textureFuture = getIconAsUint8List(widget.itemId).catchError((_) {
      return getIconAsUint8List("placeholder");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _textureFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return SizedBox.expand(child: Image.memory(snapshot.data!, width: double.infinity, fit: BoxFit.contain, filterQuality: FilterQuality.none,));
        } else if (snapshot.hasError) {
          return SizedBox.expand();
        } else {
          return SizedBox.expand(child: CircularProgressIndicator(strokeWidth: 2));
        }
      },
    );
  }
}
