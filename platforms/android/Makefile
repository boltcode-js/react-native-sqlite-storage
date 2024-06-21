
all: build

build:
	make -C android-sqlite-native-driver
	make -C android-sqlite-connector
	rm -rf libs
	mv android-sqlite-native-driver/lib libs
	mv android-sqlite-connector/sqlite-connector.jar libs/.

clean:
	make -C android-sqlite-native-driver clean
	make -C android-sqlite-connector clean
	rm -rf libs

