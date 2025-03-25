# Changelog

## [1.6.48] - 2025-03-25

### Added

- Api `Affise.settings.setOnInitSuccess`.
- Api `Affise.settings.setOnInitError`.
- Api `Affise.Debug.version`.

## [1.6.47] - 2025-03-12

### Fixed

- Fix `CI/CD`

## [1.6.46] - 2025-03-11

### Changed

- Update api `Affise.getReferrerOnServer` moved to `Affise.getDeferredDeeplink`.
- Update api `Affise.getReferrerOnServerValue` moved to `Affise.getDeferredDeeplinkValue`.

## [1.6.45] - 2025-02-25

### Added

- New module `Persistent`.
  
## [1.6.44] - 2025-02-19

### Added

- Persistent `AFFISE_DEVICE_ID`.

## [1.6.43] - 2025-02-07

### Added

- New event index `affise_event_id_index`.
- New postback index `uuid_index`.

### Fixed

- Fix `ProviderType.INSTALL_FIRST_EVENT`

## [1.6.42] - 2024-10-03

### Fixed

- Fix `Affise.Module.getStatus` timing retry.

## [1.6.41] - 2024-10-01

### Added

- Module `Subscription` StoreKit2 support.

## [1.6.40] - 2024-09-03

### Fixed

- Module `Subscription`.

### Changed

- Update `internal` library for crossplatform.

## [1.6.39] - 2024-08-16

### Added

- New internal events.

## [1.6.38] - 2024-08-06

### Added

- Api `Affise.getReferrerUrl`.
- Api `Affise.getReferrerUrlValue`.
- Api `Affise.getReferrerOnServer`.
- Api `Affise.getReferrerOnServerValue`.

### Removed

- Api `Affise.getReferrer`.
- Api `Affise.getReferrerValue`.

## [1.6.37] - 2024-08-05

### Added

- Add `NSUserActivity.referrerURL` for `Affise.getReferrer` and `Affise.getReferrerValue`

## [1.6.36] - 2024-07-30

### Fixed

- Fix `unsafe build flags`.

## [1.6.35] - 2024-07-29

### Fixed

- Api `Affise.Module.getStatus`.

## [1.6.34] - 2024-07-26

### Added

- Modules compatibility check.

## [1.6.33] - 2024-06-28

### Added

- New module `Link`.

### Changed

- Update `registerDeeplinkCallback` change uri to convenient values.
- Update `Affise.getStatus` moved to `Affise.Module.getStatus`.
- Update `Affise.moduleStart` moved to `Affise.Module.moduleStart`.
- Update `Affise.getModulesInstalled` moved to `Affise.Module.getModulesInstalled`.

## [1.6.32] - 2024-05-28

### Removed

- Result for failed `sendNow`.

### Changed

- Update `internal` library for crossplatform.
  
## [1.6.31] - 2024-05-17

### Fixed

- CI/CD.

## [1.6.30] - 2024-05-16

### Fixed

- Json serialization.

## [1.6.29] - 2024-04-24

### Added

- Event api `sendNow`.

### Removed

- Event api `sendEvents`.

### Changed

- Fix typos in `Subscription` module.

## [1.6.28] - 2024-04-01

### Added

- New module `Subscription`.
- New event `FailedPurchaseEvent`.
- New values in `PredefinedString`.

### Changed

- Improve `AffiseModuleManager`
- Update for demo app
  
[1.6.48]: https://github.com/affise/sdk-ios/compare/1.6.47...1.6.48
[1.6.47]: https://github.com/affise/sdk-ios/compare/1.6.46...1.6.47
[1.6.46]: https://github.com/affise/sdk-ios/compare/1.6.45...1.6.46
[1.6.45]: https://github.com/affise/sdk-ios/compare/1.6.44...1.6.45
[1.6.44]: https://github.com/affise/sdk-ios/compare/1.6.43...1.6.44
[1.6.43]: https://github.com/affise/sdk-ios/compare/1.6.42...1.6.43
[1.6.42]: https://github.com/affise/sdk-ios/compare/1.6.41...1.6.42
[1.6.41]: https://github.com/affise/sdk-ios/compare/1.6.40...1.6.41
[1.6.40]: https://github.com/affise/sdk-ios/compare/1.6.39...1.6.40
[1.6.39]: https://github.com/affise/sdk-ios/compare/1.6.38...1.6.39
[1.6.38]: https://github.com/affise/sdk-ios/compare/1.6.37...1.6.38
[1.6.37]: https://github.com/affise/sdk-ios/compare/1.6.36...1.6.37
[1.6.36]: https://github.com/affise/sdk-ios/compare/1.6.35...1.6.36
[1.6.35]: https://github.com/affise/sdk-ios/compare/1.6.34...1.6.35
[1.6.34]: https://github.com/affise/sdk-ios/compare/1.6.33...1.6.34
[1.6.33]: https://github.com/affise/sdk-ios/compare/1.6.32...1.6.33
[1.6.32]: https://github.com/affise/sdk-ios/compare/1.6.31...1.6.32
[1.6.31]: https://github.com/affise/sdk-ios/compare/1.6.30...1.6.31
[1.6.30]: https://github.com/affise/sdk-ios/compare/1.6.29...1.6.30
[1.6.29]: https://github.com/affise/sdk-ios/compare/1.6.28...1.6.29
[1.6.28]: https://github.com/affise/sdk-ios/compare/1.6.27...1.6.28
