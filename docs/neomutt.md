# Neomutt

## Accounts configurations

### Gmail

```
# vim: filetype=neomuttrc
set from = "example@gmail.com"
set folder = "imaps://example@imap.gmail.com:993"

# Imap
set imap_user = "example@gmail.com"
set imap_pass = "`gopass -o app.gmail.com/example`"
set spoolfile = +INBOX
set record = "[Gmail]/Enviados"
set postponed="[Gmail]/Borradores"
set imap_check_subscribed

# Mailboxes definition
unmailboxes *
mailboxes =INBOX

# Smtp
set smtp_url = "smtp://example@smtp.gmail.com:587/"
set smtp_pass = "`gopass -o app.gmail.com/example`"
set realname = "Example Gmail"
```

### Office 365

```
# vim: filetype=neomuttrc

set from = "example@domain"
set folder = "imaps://outlook.office365.com/"

# Imap
set imap_user = "example@domain"
set imap_pass = "`gopass -o uned.es/example`"
set spoolfile = "+INBOX"
set record = "+INBOX"
set imap_check_subscribed

# Mailboxes definitions
unmailboxes *
mailboxes =INBOX

# Smtp
set smtp_url = "smtp://example@domain@outlook.office365.com:587/"
set smtp_pass = "`gopass -o domain/example`"
set realname = "Example Offfice 365"
```
