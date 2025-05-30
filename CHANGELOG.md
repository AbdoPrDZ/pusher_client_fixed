## 2.0.0 - August 31, 2021

- Upgraded to null safety [@nizwar](https://github.com/nizwar)

## 1.1.3 - January 24, 2021

- BUGFIX: Binding to channel events cancels calls to onConnectionStateChange
- Added a Stream Handler contract to allow multiple classes to listen to the same event channel

## 1.1.2 - January 20, 2021

- PATCH: Removed log4j dependency for android

## 1.1.1 - January 19, 2021

- BUGFIX: ConnectionEventListener null safety issue for Android (fixed by [@spiritinlife](https://github.com/spiritinlife))

## 1.1.0 - November 20, 2020

- MINOR: Removed json_serializable and build_runner dependencies, this prevents conflict with projects that have to use those libraries at a specific version.

## 1.0.2 - November 17, 2020

- BUGFIX: Fixes issue #1, Double backslashes in the bind event breaks the JSON encoding. (This issue was only on android, iOS worked fine.)

## 1.0.1 - November 7, 2020

- BUGFIX: Fixed not being able to bind to multiple types of channels at once.

## 1.0.0 - October 26, 2020

- This is a complete Pusher Channels client library for flutter that fully supports Android and iOS with all the necessary and newest features such as having private encrypted channels. Triggering client event also works on both Android and iOS

---

## AbdoPrDZ Part

- This My Changes part

## 0.0.1

- Upgrade Kotlin SDK version.

## 0.0.2

- Fix Kotlin script errors.

## 0.0.2+1

- Upgrade Flutter SDK version.

## 0.0.2+2

- Clean the code.

## 0.0.2+3

- Update Flutter SDK version

## 0.0.3 - March 22, 2024

- Fix iOS - revert to PusherSwiftWithEncryption by (dragosholban | Dragos Holban).
- Upgrade Flutter SDK version.

## 0.0.4 - May 13, 2024

- Fix IOS - Update PusherSwiftWithEncryption to 10.1.5.
- Upgrade Flutter SDK version.

## 0.0.4+1 - Juan 17, 2024

- Upgrade Flutter SDK version.

## 0.0.4+2 - Sep 27, 2024

- Update compileSdk version.
- Added Notice on Reduced/Stopped Support in Favor of New Package.

## 0.0.5 - May 02, 2025

- Update Sdk version.
- fix namespace in android project by [@ahmedelmwafy](https://github.com/ahmedelmwafy).
