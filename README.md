# react-native-sqlite-storage

This is a fork of https://github.com/andpor/react-native-sqlite-storage in order to fix few things.

# Installation
Follow the same guideline as the original project, the only difference is to use this command for installation:
```bash
# Install this lib as an alias of react-native-sqlite-storage
yarn add react-native-sqlite-storage@npm:@boltcode/react-native-sqlite-storage

# For typescript
yarn add -D @types/react-native-sqlite-storage
```

# What's new in this fork
 - Add uuid support on android native
 - Fix the Android 11 problem (https://github.com/andpor/react-native-sqlite-storage/issues/462)
 - Add `driver-build` directly in this repository to be able to reproduce the build (more info bellow)

# Android 11 fix

Following the issue and the PR:
 - https://github.com/andpor/react-native-sqlite-storage/issues/462
 - https://github.com/andpor/react-native-sqlite-storage/pull/494

We create two folder on `driver-build`:
 - android-sqlite-connector (get from https://github.com/liteglue/Android-sqlite-connector)
 - android-sqlite-native-driver (get from https://github.com/brodybits/Android-sqlite-ext-native-driver)

We respectively patch both projects with these PR from another project:
 - android-sqlite-connector (https://github.com/OutSystems/Android-sqlite-connector/pull/1)
 - android-sqlite-native-driver (https://github.com/OutSystems/Android-sqlite-native-driver/pull/1)

Because it would be a terrible effort to have done all this work without adding a feature, I've added the 
sqlite uuid extension to the file `android-sqlite-native-driver/native/sqlc.c:sqlc_db_open`.

Also there is a script `build-android-native-driver.sh` that build both project and copies libs under `platforms/android-native/libs`.

