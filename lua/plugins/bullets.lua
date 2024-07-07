---@type LazySpec
return {
	'bullets-vim/bullets.vim',
	enabled = true,

	event = 'VeryLazy',
	init = function()
		vim.g.bullets_outline_levels = {
			'ROM',
			'ABC',
			'num',
			'abc',
			'rom',
			'std-',
			-- 'std*',
			-- 'std+'
		}
	end,
}
