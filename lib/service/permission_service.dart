import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.photos,
      Permission.storage,
      Permission.contacts
    ].request();

    if (statuses[Permission.camera]!.isDenied ||
        statuses[Permission.microphone]!.isDenied ||
        statuses[Permission.photos]!.isDenied ||
        statuses[Permission.storage]!.isDenied ||
        statuses[Permission.contacts]!.isDenied
    ) {
      // Handle the case when permissions are denied
      print("Some permissions are denied");
    }
  }
}
