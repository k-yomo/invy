import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // TOOD: Use env var
    //   https://zenn.dev/taitai9847/articles/0be7298408b7c8
    GMSServices.provideAPIKey("AIzaSyC5-1sT3hduoMlGnrBTVTaQo-Al0GpRC_Q")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
