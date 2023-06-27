include test-dependencies.mk

all: test-all

test-all: all-test-dependencies
	cc test-base64-encode.c sqlite3_base64.c $(TEST_SQLITE3) $(TEST_LIBB64_CENCODE) $(TEST_LIBB64_CDECODE) $(TEST_INCLUDE_FLAGS) -o test-base64-encode.out
	./test-base64-encode.out
	cc test-blobfrombase64.c sqlite3_base64.c $(TEST_SQLITE3) $(TEST_LIBB64_CENCODE) $(TEST_LIBB64_CDECODE) $(TEST_INCLUDE_FLAGS) -o test-blobfrombase64.out
	./test-blobfrombase64.out

test-clean: clean-test-dependencies
	rm -rf ./test*.out
