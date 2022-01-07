#!/usr/bin/env bash

# make a lock
redis-cli SET key token NX PX 10000

# del lock
redis-cli --eval delLockLua.lua lock:user , haha

# make multi lock
redis-cli --eval multiLock.lua {lock}:foo {lock}:bar , token 100000

# del multi lock
redis-cli --eval delMultiLock.lua {lock}:foo {lock}:bar , token

