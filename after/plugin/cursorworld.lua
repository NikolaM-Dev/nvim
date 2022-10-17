local status_ok, cursorworld = pcall(require, 'mini.cursorword')
if not status_ok then
	return
end

cursorworld.setup({
	-- Delay (in ms) between when cursor moved and when highlighting appeared
	delay = 100,
})
