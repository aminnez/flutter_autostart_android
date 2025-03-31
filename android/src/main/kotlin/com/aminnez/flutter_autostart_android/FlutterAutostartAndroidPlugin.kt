package com.aminnez.flutter_autostart_android

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAutostartAndroidPlugin */
class FlutterAutostartAndroidPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this.context = flutterPluginBinding.applicationContext

        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_autostart_android")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {

        when (call.method) {
            "isAutoStartPermissionAvailable" -> {
                val onlyIfSupported = call.argument<Boolean>("onlyIfSupported") ?: false
                val autoStartPermissionHelper = AutoStartPermissionHelper.getInstance()

                result.success(
                        autoStartPermissionHelper.isAutoStartPermissionAvailable(
                                context,
                                onlyIfSupported
                        )
                )
            }
            "requestAutoStart" -> {
                val autoStartPermissionHelper = AutoStartPermissionHelper.getInstance()
                result.success(
                        autoStartPermissionHelper.getAutoStartPermission(context, true, true)
                )
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
