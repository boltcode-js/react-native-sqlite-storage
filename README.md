# react-native-sqlite-storage

This is a fork of https://github.com/andpor/react-native-sqlite-storage in order to fix few things.

# What's new in this fork

 - Add uuid support on android native
 - Fix the Android 11 problem (https://github.com/andpor/react-native-sqlite-storage/issues/462)
 - Add `driver-build` directly in this repository to be able to reproduce the build (more info bellow)
 - Update SQLite version to 3.43.1 (2023-08-24)


# Installation
Follow the same guideline as the original project, the only difference is to use this command for installation:
```bash
# Install this lib as an alias of react-native-sqlite-storage
yarn add react-native-sqlite-storage@npm:@boltcode/react-native-sqlite-storage

# For typescript
yarn add -D @types/react-native-sqlite-storage
```

That's it, following steps are to explain how I manage to make everything works together.

# How to reproduce

## Android 11 fix

Following the issue and the PR:
 - https://github.com/andpor/react-native-sqlite-storage/issues/462
 - https://github.com/andpor/react-native-sqlite-storage/pull/494

We create two folder in `driver-build`:
 - android-sqlite-connector (get from https://github.com/liteglue/Android-sqlite-connector)
 - android-sqlite-native-driver (get from https://github.com/brodybits/Android-sqlite-ext-native-driver)

We respectively patch both projects with these PR from another project:
 - android-sqlite-connector (https://github.com/OutSystems/Android-sqlite-connector/pull/1)
 - android-sqlite-native-driver (https://github.com/OutSystems/Android-sqlite-native-driver/pull/1)

## Add UUID support

Because it would be a terrible effort to have done all this work without adding a feature, I've added the 
sqlite uuid extension to the file `android-sqlite-native-driver/native/sqlc.c:sqlc_db_open:63`.

## Update SQLite version

Also I've updated the sqlite version to the most up-to-date (in fact is not the last version but it's the last available on the sqlite-amalgamation repositiory).
Version: 3.43.1 (2023-08-24)

```bash
cd driver-build/android-sqlite-native-driver
rm -rf sqlite-amalgamation
git clone https://github.com/liteglue/sqlite-amalgamation.git
cd ..
./build-android-native-driver.sh
```

## Build the driver

```bash
cd driver-build
./build-android-native-driver.sh
```
This will build both project and copies libs under `platforms/android-native/libs`, you need to have the android NDK in your path.

### Troubleshoots

When running build-android-native-driver.sh, you may have the following error on a Mac M1:
```bash
ERROR: Unknown host CPU architecture: arm64
```
You can follow this thread to solve it: https://stackoverflow.com/a/69555276/10440469