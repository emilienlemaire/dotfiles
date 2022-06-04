local newpaper = require("newpaper")

local custom_highlights = {
  TSError = {fg = "None", bg = "None"}
}

newpaper.setup {
  style = "dark",
  custom_highlights = custom_highlights,
}
