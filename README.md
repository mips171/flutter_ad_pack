June 2023 - This repo is made read-only as a reference.

This library contains everything you need to serve responsive
banner ads in a Flutter application.

# How to use

1. Copy the `ads/` directory to your Flutter project's `lib/` directory.

1. Install the `connectivity_plus` package

    `flutter pub add connectivity_plus`


1. Install the `google_mobile_ads` package (use 0.13.6, 1.0.0 not compiling)
   Add this to your `pubspec.yaml` under `dependencies:`
     `google_mobile_ads: ^0.13.6`


1. `ad_state.dart` - put your unique AdMob ID's here. Get a new AdMob id here: https://apps.admob.com/


1. In your `main.dart` file, replace your `main` function with this:

```
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
    value: adState,
    builder: (context, child) => MyApp(),
  ));
}
```

1. To use, put the `BannerAD` widget anywhere like this:

    `BannerAD(),`


1. Remember to change to your real AdMob ID for production.  

1. Optionally, personalize the messages in `banner_ad.dart`.
