# How to reproduce

Requirements:
 - JDK (minimum 1.7)
 - Android NDK (Set ANDROID_NDK_HOME and add NDK to the path)

# SQLite

Under the `sqlite` folder, we have all we need to build SQLite with all extensions we need, almost all subfolder are submodules:
 - sqlite-amalgamation (https://github.com/liteglue/sqlite-amalgamation): the base SQLite implementation
 - libb64-core (https://github.com/brodybits/libb64-core): base64 C implementation
 - sqlite3-base64 (https://github.com/brodybits/sqlite3-base64): SQLite base64 extension
 - sqlite3-regexp-cached: (https://github.com/brodybits/sqlite3-regexp-cached): SQLite REGEXP extension
 - sqlite-uuid (https://sqlite.org/src/file/ext/misc/uuid.c): SQLite UUID extension
 - gluegentools (https://github.com/sqlg/gluegentools): Honestly I don't know exactly what it's for

Note: In order to update the SQLite version, we just need to update the sqlite-amalgamation submodule.

# Android

Under `platforms/android` we have all we need to build the SQLite module for android.  
You should note we have two subfolder:
 - `android-sqlite-native-driver`: Make the link between SQLite, all extension and JNI
 - `android-sqlite-connector`: The bridge between JNI and Java to use SQLite on Android

Theses two folder come from two different repo but are not submodule because they have been tweeked to fix the Android 11 bug.  
Under `src/main/...` there is the bridge from Java to Javascript in order to use the library with React Native.

## Android 11 fix

Following the issue and the PR:
 - https://github.com/andpor/react-native-sqlite-storage/issues/462
 - https://github.com/andpor/react-native-sqlite-storage/pull/494

We create two folder in `platforms/android`:
 - android-sqlite-connector (get from https://github.com/liteglue/Android-sqlite-connector)
 - android-sqlite-native-driver (get from https://github.com/brodybits/Android-sqlite-ext-native-driver)

We respectively patch both projects with these PR from another project:
 - android-sqlite-connector (https://github.com/OutSystems/Android-sqlite-connector/pull/1)
 - android-sqlite-native-driver (https://github.com/OutSystems/Android-sqlite-native-driver/pull/1)

## Build the driver

In order to making thing work with Android, we first need to build the connector & driver, run:
```bash
make -C platforms/android
```
This will build both project and move libs & connector under `platforms/android-native/libs`, you need to have the android NDK in your path.  
**DON'T FORGET TO RUN THIS COMMAND BEFORE DEPLOYING ON NPM.**

# iOS

Under `platforms/ios`, the code is close to the one in the original repository (https://github.com/andpor/react-native-sqlite-storage/blob/master/platforms/ios/SQLite.m), but we made few changes:
 - Remove thing related to regex (as it's now bundled with our SQLite)
 - Remove the `sqlite` library reference in the `react-native-sqlite-storage.podspec` (as it's now bundled with our SQLite too)
 - Add `#include "../../sqlite/sqlite-amalgamation/sqlite3.h"` (and few other stuff) in the `SQlite.m` file, in order to effectively use our SQLite version

