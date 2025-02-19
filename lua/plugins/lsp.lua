return {
	{
		'neovim/nvim-lspconfig',
	},
	{
		'williamboman/mason.nvim',
		opts = {
			ensure_installed = {
				"gopls",
			},
		},
	},
	{'williamboman/mason-lspconfig.nvim'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
}
