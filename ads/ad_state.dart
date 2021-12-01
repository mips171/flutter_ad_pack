import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class AdState {
  final testAndroidBannerId = 'ca-app-pub-3940256099942544/6300978111';
  final testiOSBannerId = 'ca-app-pub-3940256099942544/2934735716';

  final realAndroidBannerId = '';
  final realiOSBannerId = '';

  Future<InitializationStatus> initialization;
  AdState(this.initialization);

  String? get bannerAdUnitId => Platform.isAndroid
      ? testAndroidBannerId // test AdMob ID (banner ad)
      // ? realAndroidBannerId // real AdMob ID
      : testiOSBannerId;
  // : realiOSBannerId; // real AdMob iOS ID

  AdManagerBannerAdListener get adListener => _adListener;

  AdManagerBannerAdListener _adListener = AdManagerBannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => debugPrint('Ad impression.'),
    onAppEvent: (ad, name, data) =>
        debugPrint('App event : ${ad.adUnitId}, $name, $data.'),
  );
}
