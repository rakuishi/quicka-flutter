# Quicka

> Quicka - 検索を快適に

<img src="/.github/Screenshot.png" width="360" />

## Install Flutter

https://flutter.dev/docs/get-started/install/macos

```
$ cd ~/Projects
$ unzip ~/Downloads/flutter_macos_v1.9.1+hotfix.2-stable.zip
$ export PATH="$PATH:/Users/rakuishi/Projects/flutter/bin"
$ source ~/.bash_profile
$ flutter precache
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.9.1+hotfix.2, on Mac OS X 10.14.6 18G87, locale en-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 11.0)
[!] Android Studio (version 3.5)
    ✗ Flutter plugin not installed; this adds Flutter specific functionality.
    ✗ Dart plugin not installed; this adds Dart specific functionality.
[!] VS Code (version 1.37.1)
    ✗ Flutter extension not installed; install from
      https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[!] Connected device
    ! No devices available

! Doctor found issues in 3 categories.
```

## Install Dart plugins

https://flutter.dev/docs/get-started/editor

1. Start Android Studio.
2. Open plugin preferences (Preferences > Plugins on macOS, File > Settings > Plugins on Windows & Linux).
3. Select Browse repositories, select the Flutter plugin and click Install.
4. Click Yes when prompted to install the Dart plugin.
5. Click Restart when prompted.

```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.9.1+hotfix.2, on Mac OS X 10.14.6 18G87, locale en-JP)
 
[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 11.0)
[✓] Android Studio (version 3.5)
[!] VS Code (version 1.37.1)
    ✗ Flutter extension not installed; install from
      https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[!] Connected device
    ! No devices available

! Doctor found issues in 2 categories.
```
