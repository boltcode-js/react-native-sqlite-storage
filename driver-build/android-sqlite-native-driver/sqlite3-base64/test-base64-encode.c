#include "sqlite3.h"

#include "sqlite3_base64.h"

#include <assert.h>

#include <string.h>

static int assert_base64_count = 0;

static int assert_base64_value(void * _, int result_count, char ** results, char ** _2) {
  assert(result_count == 1);
  assert(!strcmp(results[0], "AQID\n"));
  ++assert_base64_count;
  return 0;
}

int main(int argc, char ** argv) {
  sqlite3 * testdb;

  int open_rc = sqlite3_open(":memory:", &testdb);

  assert(open_rc == 0);

  assert(sqlite3_base64_init(testdb) == 0);

  sqlite3_exec(testdb, "SELECT BASE64(X'010203')", assert_base64_value, NULL, NULL);
  assert(assert_base64_count == 1);
}
