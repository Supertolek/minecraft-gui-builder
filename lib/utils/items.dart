import 'dart:ui';
import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

Future<Image> getIcon(String blockId) async {
  final data = await rootBundle.load('assets/icons/$blockId.png');
  return decodeImageFromList(data.buffer.asUint8List());
}

Future<Uint8List> getIconAsUint8List(String blockId) async {
  final data = await rootBundle.load('assets/icons/$blockId.png');
  return data.buffer.asUint8List();
}

Future<String> getName(String blockId) async {
  final data = await rootBundle.loadString('assets/en_us.json');
  final langFile = jsonDecode(data) as Map;
  return langFile["block.minecraft.$blockId"];
}

Future<bool> isValidId(String blockId) async {
  try {
    await rootBundle.load('assets/icons/$blockId.png');
    return true;
  } catch (e) {
    return false;
  }
}