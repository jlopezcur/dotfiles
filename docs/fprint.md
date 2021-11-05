# Fprint

## Troubleshooting

Check that the device is listed in

```sh
lsusb
```

Check for messages on the service

```sh
journalctl -u fprintd.service
```

If a problem of permission arise and you are using (like me) a software with no
authenthication agent (I use login directly), you can use this trick:

```sh
paru lxsession
lxsession &
fprintd-enroll
```

