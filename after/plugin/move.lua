local status_ok, move = pcall(require, 'mini.move')
if not status_ok then
	return
end

move.setup({
	mappings = {
		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
		down = '<M-J>',
		left = '<M-H>',
		right = '<M-L>',
		up = '<M-K>',

		-- Move current line in Normal mode
		line_down = '<M-J>',
		line_left = '<M-H>',
		line_right = '<M-L>',
		line_up = '<M-K>',
	},
})
