import background_locator_2
import UIKit
import Flutter
import GoogleMaps

func registerPlugins(registry: FlutterPluginRegistry) {
    GeneratedPluginRegistrant.register(with: registry)
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    BackgroundLocatorPlugin.setPluginRegistrantCallback(registerPlugins)
    // TOOD: Use env var
    //   https://zenn.dev/taitai9847/articles/0be7298408b7c8
    GMSServices.provideAPIKey("AIzaSyC5-1sT3hduoMlGnrBTVTaQo-Al0GpRC_Q")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
