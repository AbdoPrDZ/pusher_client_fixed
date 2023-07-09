package com.github.chinloyal.pusher_client

import androidx.annotation.NonNull
import com.github.chinloyal.pusher_client.pusher.PusherService

import io.flutter.embedding.engine.plugins.FlutterPlugin

/** PusherClientPlugin */
class PusherClientPlugin: FlutterPlugin {

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    PusherService().register(flutterPluginBinding.binaryMessenger);
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
//    channel.setMethodCallHandler(null)
  }
}
