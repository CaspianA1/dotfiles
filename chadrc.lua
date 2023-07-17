---@type ChadrcConfig

---------- Setting some tab/indent defaults

local opt = vim.opt

-- Overriding NvChad defaults
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Setting my own defaults
opt.autoindent = true

---------- Making a neat toggling command

-- TODO: get the toggling button to show up by default
vim.api.nvim_create_user_command("X", function()
	require("base46").toggle_theme()
end, {})

---------- Defining the UI

--[[
	For the light theme, I go for "everforest_light" or "gruvbox_light".
	For the dark theme, I go for "ayu_dark" or "gruvbox."
--]]

local M = {
	ui = {
		theme = "everforest_light",
		theme_toggle = {"everforest_light", "gruvbox"},
		nvdash = {load_on_startup = true},
		transparency = false
	},
}

return M

---------- Miscellaneous info

--[[
Facts:
	- Windows contain buffers
	- Tabs contain windows (so for storing separate projects)
	- sp/vsp make windows
	- :e makes buffers

Command info:
	Colon modifiers:
		Nvdash = get dashboard
		NvChadUpdate = update installed packages
		NvCheatsheet = bring up the cheatsheet

	Space modifiers:
		ch = bring up the cheatsheet
		b = make a new buffer
		/ = toggle comment

		v = vertical terminal
		h = horizontal terminal

		fz = grep for text in current file
		fw = grep for text in files
		fa = grep for filenames

		cm = view all git commits with diff previews
		gt = view git status, along with a diff preview for each changed file

		fh = find help

	Miscellaneous:
		<tab> = cycle through buffers
		<C-n> = toggle Nvtree (note: the tree is a window, not a buffer)
		<C-'h/j/k/l'> = switch to a window in a certain direction
--]]

---------- TODOs

--[[
To figure out:
	- How to reopen the last closed buffer, and how to move buffers around
	- Floating terminals
	- Get custom packages (e.g. 'shade')
	- Figure out how to get LSP integration for more languages
	
Bugs:
	- There are missing Unicode characters when doing <C-w>

	- Having the directory viewer open, with multiple buffers on the right,
		and then closing a buffer, leads to only the directory viewer open
		until another buffer is opened again

	- When you close a window, its buffer(s) will remain open 
	
Other:
	- Get the Copilot plugin
	- Window switching from the terminal (probably just a keybinding setup)
--]]

----------
