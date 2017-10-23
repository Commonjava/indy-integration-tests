# Test script for NOS-1074 (Concurrent requests for FIRST generation of group metadata)

This bug was a race condition in the concurrent download logic of Galley (the transport mechanism in Indy), which could sometimes result in two simultaneous requests being allowed in to write the same file at the same time. When this happened during Maven metadata aggregation/generation, it could result in unparseable or empty metadata files being returned to the one user (the literal first one to complete).

## How to run

This runs well if you have something like `screen`. If not, you'll need two terminal windows.

In one screen / window:

```
    $ ./start-indy /path/to/indy/workdir
```

In another screen:

```
    $ export DOWNLOADS=<num-downloads-per-round>
    $ export TRIES=<num-download-rounds>
    $ export WAIT=<wait-secs-per-round>
    $ ./run.sh
```

Of course, all of the variables above (`DOWNLOADS`, `TRIES`, and `WAIT`) have default values...but tweaking these values may help express the race condition more reliably.

This test script will check that the sizes of all downloaded metadata files in a round are the same size. If they aren't, it will print the file sizes along with `HIT!`. If all is well, the round will output the single file size and `MISS.`
