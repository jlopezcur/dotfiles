# Pam

## pam-gnupg

```sh
paru pam-gnupg
```

Add at the end of the file `/etc/pam.d/system-local-login`

```
auth      optional  pam_gnupg.so store-only
session   optional  pam_gnupg.so
```

## References

- https://wiki.archlinux.org/title/PAM
- https://github.com/cruegge/pam-gnupg
