local nightfox = require("nightfox")

nightfox.setup(
  {
    fox = "nightfox",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      functions = "italic,bold"
    }
  }
)

-- Load the configuration set above and apply the colorscheme
nightfox.load()
