import 'package:flutter/services.dart';

class DeviceInfoServices {
  static const MethodChannel _channel = MethodChannel('com.example.device_id');

  static Future<String?> getDeviceId() async {
    try {
      final String? deviceId = await _channel.invokeMethod('getDeviceId');
      return deviceId;
    } on PlatformException catch (e) {
      print('Failed to get device ID: ${e.message}');
      return null;
    }
  }
}
