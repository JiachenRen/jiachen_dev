import 'package:platform_detect/platform_detect.dart' as platform;

mixin DetectBrowser {
  platform.Browser get browser => platform.browser;

  bool get isHighPerformance => !browser.isSafari;
}
