# sqlite3-base64

Add base-64 encoding & decoding functions to SQLite3:

- `BASE64`
- `BLOBFROMBASE64`

**LICENSE:** UNLICENSE (public domain) ref: <http://unlicense.org/>

## External dependencies

- `cencode.h`, `cencode.c`, `cdecode.h`, `cdecode.c` from <https://github.com/gorb314/libb64> or a fork such as <https://github.com/brodybits/libb64-core> (public domain)
- `sqlite3.h`

**NOTE:** `cencode.h` and `cdecode.h` must be in the build path.

## Sample usage

After opening sqlite3 database:

```c
sqlite3_base64_init(db);
```

Then the following SQL:
```sql
SELECT BASE64(X'010203')
```

returns the following value _ending with a newline (`\n`)_:
```
AQID
```

And the following SQL:

```sql
SELECT HEX(BLOBFROMBASE64('AQID'))
```

returns the following value: `010203`
