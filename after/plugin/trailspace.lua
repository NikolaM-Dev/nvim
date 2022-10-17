local status_ok, trailspace = pcall(require, 'mini.trailspace')
if not status_ok then
	return
end

trailspace.setup({
	-- Highlight only in normal buffers (ones with empty 'buftype'). This is
	-- useful to not show trailing whitespace where it usually doesn't matter.
	only_in_normal_buffers = true,
})
