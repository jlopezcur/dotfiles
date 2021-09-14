return {
  lintCommand = 'shellcheck ${INPUT}',
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatStdin = true
}
