if (uwsm check may-start | complete).exit_code == 0 {
  exec uwsm start sway.desktop
}
