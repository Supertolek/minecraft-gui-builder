class MinecraftRichText {}

class Item {
  MinecraftRichText? itemName;
  MinecraftRichText? itemLore;
  int itemCount = 1;
}

String generateDataPack() {
  return "";
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
