require("dendrobyte.remap")

-- Set up some basic vim fields
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Set up LSP stuff as per LSP Zero configuration

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

---
-- Autocompletion config
---
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})

-- End of LSP-Zero LSP setup --
-- TODO: Move it into a lspsetup.lua or something in the /dendrobyte folder?

-- Set up for nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Set the vim theme
-- vim.cmd("colorscheme nightfox")
vim.cmd.colorscheme('everforest')

function ToggleBg(darkOrLight, hardMediumOrSoft)
	if darkOrLight == "dark" or darkOrLight == "light" then
		vim.o.background = darkOrLight
	else
		print("Invalid vim background color: " .. darkOrLight)
		return
	end

	if hardMediumOrSoft == "hard" or hardMediumOrSoft == "medium" or hardMediumOrSoft == "soft" then
		vim.g.everforest_background = hardMediumOrSoft
	else
		print("Invalid everforest background color: " .. hardMediumOrSoft)
		return
	end
	vim.cmd('colorscheme everforest')
end

-- Small function to cycle through my choices of dark/light everforest themes
local toggleFavorite = 0 -- Not a boolean in case I want to increase options in the future
function CycleBg()
	if toggleFavorite == 0 then
		ToggleBg("dark", "hard")
		toggleFavorite = 1
	else
		ToggleBg("light", "soft")
		toggleFavorite = 0
	end
end

-- Start at the dark one, maybe I'll go look for a different light theme if a time calls for it
CycleBg()
print("Initialized dendrobyte lua file!")
