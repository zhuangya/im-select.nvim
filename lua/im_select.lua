local M = {}

local function all_trim(s)
	return s:match("^%s*(.-)%s*$")
end

M.setup = function(opts)
	if vim.fn.has("macunix") ~= 1 then
		return
	end

	if vim.fn.executable("im-select") ~= 1 then
		vim.api.nvim_err_writeln(
			[[please install `im-select` first, repo url: https://github.com/daipeihust/im-select ]]
		)
		return
	end

	local default_im_select = "com.apple.keylayout.ABC"
	if opts ~= nil and opts.im_select_default_im_select ~= nil then
		default_im_select = opts.im_select_default_im_select
	end

	vim.api.nvim_create_autocmd({ "InsertLeave", "VimEnter" }, {
			vim.fn.system({ "im-select", default_im_select })
		end,
	})
end

return M
