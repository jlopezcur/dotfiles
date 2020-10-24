# UFW

[Arch Wiki](https://wiki.archlinux.org/index.php/Uncomplicated_Firewall)

## VPN

Adjust the `DEFAULT_FORWARD_POLICY` variable in `/etc/default/ufw` from a value
of *"DROP"* to *"ACCEPT"* for proper VPN operation.
