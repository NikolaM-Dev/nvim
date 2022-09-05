local status_ok, mcc = pcall(require, 'mcc')
if not status_ok then
	return
end

mcc.setup({
	go = { ';', ':=', ';' },
	json = { '\'', '"', '\'' },
})
