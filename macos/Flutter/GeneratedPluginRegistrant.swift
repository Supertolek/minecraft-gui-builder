//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import quill_native_bridge_macos
import screen_retriever_macos
import url_launcher_macos
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  QuillNativeBridgePlugin.register(with: registry.registrar(forPlugin: "QuillNativeBridgePlugin"))
  ScreenRetrieverMacosPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverMacosPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
