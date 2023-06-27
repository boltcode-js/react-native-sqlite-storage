#!/bin/zsh
cd $(dirname "$0")

rm -rf ../platforms/android-native/libs

cd android-sqlite-native-driver
make
cp -a lib ../../platforms/android-native/libs
cd -

cd android-sqlite-connector
make
cp sqlite-connector.jar ../../platforms/android-native/libs/sqlite-connector.jar
cd -

