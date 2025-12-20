return {
	"rcarriga/nvim-notify",
	opts = {
		background_colour = "NotifyBackground",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		render = "default",
		stages = "slide",
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T",
		},
		timeout = 5000,
		top_down = true,
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)
		vim.notify = notify
		-- TODO: This doesn't work
		--vim.keymap.set('n', '<Esc>', notify.dismiss, { silent = true, desc = 'Dismiss all notifications', remap = true })
		vim.keymap.set(
			"n",
			"<C-Esc>",
			notify.dismiss,
			{ silent = true, desc = "Dismiss all notifications", remap = true }
		)
	end,
}
