tokyoTonight = {
	  "folke/tokyonight.nvim",
	  lazy = true,
	  priority = 1000,
	  opts = function()
		vim.cmd.colorscheme('tokyonight')
	  end
	}

-- There is documentation to change the lightness of this on the GitHub
-- I think we'd need to call vim.api.nvim.set... or something to get those?
everForest = {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
      end
    }

nightfox = { "EdenEast/nightfox.nvim" }

return {
   tokyoTonight,
   everForest,
   nightfox
}
