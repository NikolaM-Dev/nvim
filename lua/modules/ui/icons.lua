local status_ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
if not status_ok then
	return
end

nvim_web_devicons.set_icon({
	['README.md'] = {
		icon = '',
		color = '#42a5f5',
		name = 'Readme',
	},
})
