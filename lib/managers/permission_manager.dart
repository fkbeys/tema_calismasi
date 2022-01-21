import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission() async {
  final serviceStatus = await Permission.camera.isGranted;

  bool isCameraOn = serviceStatus == ServiceStatus.enabled;

  final status = await Permission.camera.request();

  if (status == PermissionStatus.granted) {
    print('Permission Granted');
  } else if (status == PermissionStatus.denied) {
    print('Permission denied');
  } else if (status == PermissionStatus.permanentlyDenied) {
    print('Permission Permanently Denied');
    await openAppSettings();
  }
}

Future<void> requestLocationPermission() async {
  final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;

  bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

  final status = await Permission.locationWhenInUse.request();

  if (status == PermissionStatus.granted) {
    print('Permission Granted');
  } else if (status == PermissionStatus.denied) {
    print('Permission denied');
  } else if (status == PermissionStatus.permanentlyDenied) {
    print('Permission Permanently Denied');
    await openAppSettings();
  }
}
