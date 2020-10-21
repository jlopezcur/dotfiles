# Intel

```sh
yay -S xf86-video-intel
```

/etc/X11/xorg.conf.d/20-intel.conf
```
Section "Device"
  Identifier "Intel Graphics"
  Driver "intel"
  Option "AccelMethod" "sna"
EndSection
```

/etc/modprobe.d/i915.conf
```
options i915 endable_fbc=1
options i915 fastboot=1
```

## References

- https://wiki.archlinux.org/index.php/Intel_graphics#Xorg_configuration


