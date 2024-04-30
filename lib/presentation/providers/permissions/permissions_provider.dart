import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider = StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
  return PermissionsNotifier();
});

class PermissionsNotifier extends StateNotifier<PermissionsState> {

  PermissionsNotifier(): super(PermissionsState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {

    final permissionsList = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsList[0],
      photoLibrary: permissionsList[1],
      sensors: permissionsList[2],
      location: permissionsList[3],
      locationAlways: permissionsList[4],
      locationWhenInUse: permissionsList[5],
    );
  }

  Future<PermissionStatus> _requestPermission(Permission permission) async {
    final PermissionStatus status = await permission.request();
    if(status == PermissionStatus.permanentlyDenied) { openAppSettings(); }
    return status;
  }

  requestCameraAccess() async {
    state = state.copyWith(camera: await _requestPermission(Permission.camera));
  }

  requestPhotoLibraryAccess() async {
    state = state.copyWith(photoLibrary: await _requestPermission(Permission.photos));
  }

  requestSensorsAccess() async {
    state = state.copyWith(sensors: await _requestPermission(Permission.sensors));
  }

  requestLocationAccess() async {
    state = state.copyWith(location: await _requestPermission(Permission.location));
  }

  requestLocationAlwaysAccess() async {
    state = state.copyWith(locationAlways: await _requestPermission(Permission.locationAlways));
  }

  requestLocationWhenInUseAccess() async {
    state = state.copyWith(locationWhenInUse: await _requestPermission(Permission.locationWhenInUse));
  }

}

class PermissionsState {

  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) {
    return PermissionsState(
      camera: camera ?? this.camera,
      photoLibrary: photoLibrary ?? this.photoLibrary,
      sensors: sensors ?? this.sensors,
      location: location ?? this.location,
      locationAlways: locationAlways ?? this.locationAlways,
      locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
    );
  }
}