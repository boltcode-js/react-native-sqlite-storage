
all: javabuild

javabuild:
	rm -rf build
	mkdir build
	javac -source 1.7 -target 1.7 -Xlint:-options -d build src/io/liteglue/*.java
	cd build && jar cf ../sqlite-connector.jar *

clean:
	rm -rf build sqlite-connector.jar

