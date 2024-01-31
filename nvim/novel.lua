vim.cmd("autocmd BufNewFile,BufRead *.novel set filetype=novel")
local configs = require("lspconfig.configs")
if not configs.novel then
	configs.novel = {
		default_config = {
			cmd = { "/home/kamo-death/code/immersive-writing/target/debug/novel-server" },
			filetypes = { "novel" },
			root_dir = function()
				return vim.fn.getcwd()
			end,
			single_file_support = true,
		},
		docs = {
			description = [[ Novel Copilot Server ]],
			default_config = {
				root_dir = [[root_pattern(".git")]],
			},
		},
	}
end

return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			novel = {},
		},
	},
}
