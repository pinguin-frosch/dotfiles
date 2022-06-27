local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    theme = function()
        if vim.o.background == "dark" then
            return "onedark_dark"
        else
            return "onelight"
        end
    end,
    colors = {
        onedark_dark = {
            bg = "#000000"
        },
        onelight = {
            bg = "#ffffff"
        }
    }
})
onedarkpro.load()
