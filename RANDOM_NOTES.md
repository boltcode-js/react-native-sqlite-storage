# Structure

```
.
├── sqlite # The pure C SQLite implementation (including JSON, BASE64, REGEX, UUID extensions)
└── platforms/
    ├── android # The android project & driver/
    │   ├── drivers/
    │   │   ├── android-sqlite-connector
    │   │   └── android-sqllite-native-driver
    │   └── src/ # react-native module
    └── ios # react-native module
```

`android-sqlite-native-driver` -> Build libs (build sqlite3 with sqlc & JNI binding)
-> Edited to use global SQLite

`android-sqlite-connector` -> Build the Java interface for SQLite using the previously created JNI binding
-> Little patch

`src/main` -> Bind the Java interface to React Native module

Build android:
1. make -C platforms/android
2. Publish

TODO: .npmignore android-sqlite-connector & android-sqllite-native-driver