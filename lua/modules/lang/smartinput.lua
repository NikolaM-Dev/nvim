local status_ok, smartinput = pcall(require, 'smartinput')
if not status_ok then
	return
end

smartinput.setup({
	['go'] = { ';', ':=', ';' },
})
