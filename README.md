Just run the container with the following command:

```
docker run --rm -v LOG_imapsync:/tmp/LOG_imapsync 2ndkauboy/imapsync --logdir="/tmp/LOG_imapsync" <imapsync arguments>
```

It will do the sync and write the log files to the host system.