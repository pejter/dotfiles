vim.api.nvim_create_autocmd("TermClose", {
	callback = function ()
		vim.cmd("bwipeout")
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function ()
		vim.lsp.buf.format()
	end
})
