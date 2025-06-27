import 'dart:io';

class MinecraftRichText {}

void main() {
  // generateDataPack();
}

class Item {
  MinecraftRichText? itemName;
  MinecraftRichText? itemLore;
  int itemCount = 1;
}

late Directory appStorage;
late Directory dataPacks;
late File packScriptCompiler;

void generateDataPack(String dataPackName) {
  // Get path to AppData
  Map<String, String> envVars = Platform.environment;
  String? appDataPath = envVars["AppData"];
  if (appDataPath == null) {
    return;
  }
  Directory appData = Directory(appDataPath);
  if (!appData.existsSync()) {
    return;
  }

  // Get app storage directory
  String appStoragePath = "$appDataPath\\gui_builder";
  appStorage = Directory(appStoragePath);
  if (!appStorage.existsSync()) {
    return;
  }

  // Generate default datapack with callbacks
  String packScriptCompilerPath = "$appStoragePath\\packscript.py";
  File packScriptCompiler = File(packScriptCompilerPath);
  if (!packScriptCompiler.existsSync()) {
    return;
  }

  // Get app storage directory
  String dataPacksPath = "$appStoragePath\\datapacks";
  Directory dataPacks = Directory(dataPacksPath);
  if (!dataPacks.existsSync()) {
    return;
  }

  // Get app storage directory
  String currentDataPackPath = "$dataPacksPath\\$dataPackName";
  // Directory currentDataPack = Directory(currentDataPackPath);
  // if (!currentDataPack.existsSync()) {
  //   return;
  // }

  // ProcessResult result = 
  Process.runSync("py", [
    packScriptCompiler.path,
    "init",
    "-o \"${currentDataPackPath}\"",
    "-N \"$dataPackName\"",
    "-n \"${dataPackName.toLowerCase().replaceAll(RegExp("[- ]*"), "_")}\"",
    "-f 71",
  ]);
}

void aaa(String dataPackName) {
  // Get app storage directory
  String currentDataPackPath = "${dataPacks.path}\\$dataPackName";
  Directory currentDataPack = Directory(currentDataPackPath);
  if (!currentDataPack.existsSync()) {
    return;
  }

  // ProcessResult result = 
  Process.runSync("py", [
    packScriptCompiler.path,
    "comp",
    "-i",
    "\"${currentDataPack.path}\"",
    "-o",
    "\"${currentDataPack.path}.result\"",
  ]);
}

String generateOpenDotMcFunction(String pageName) {
  return """function gui:barrel/ui/$pageName/mask
data modify storage minecraft:ui current append from storage minecraft:ui mask[]
data modify entity @s data.page.mask set value "function gui:barrel/ui/$pageName/mask"
data modify entity @s data.page.name set value "$pageName"
function gui:barrel/load_page""";
}

String generateMaskDotMcFunction(String pageName) {
  // Map test = {"minecraft:custom_name":[{"text":"aa","obfuscated":true,"italic":false},"a",{"text":" ","italic":false},{"text":"t","italic":false,"bold":true},{"text":"h","italic":false,"underlined":true,"bold":true},{"text":"in","italic":false,"underlined":true,"color":"blue"},{"text":"g","italic":false,"color":"blue","strikethrough":true},{"text":"aa","italic":false,"color":"blue","obfuscated":true},{"italic":false,"text":"🏹"}],"minecraft:lore":[[{"text":"this lore is kinda lame. Why is minecraft too lazy to autowrap? that is a hell of a question","italic":false}]],"minecraft:tooltip_display":{"hide_tooltip":true}};
  return "";
}
