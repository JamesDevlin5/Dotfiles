-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/james/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/james/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/james/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/james/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/james/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\2F\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\vignore\a^$\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\1\2{\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\15dimensions\1\0\2\nwidth\4š³æÌ\t™³¦ÿ\3\vheight\4æÌ™³\6æÌ™ÿ\3\1\0\1\nblend\3\n\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  darcula = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/darcula",
    url = "https://github.com/doums/darcula"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2c\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17watch_gitdir\1\0\0\1\0\1\rinterval\3€›î\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2\3\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\a\0\0\14gitcommit\thelp\rmarkdown\tbash\nshell\nFTerm\14char_list\1\0\b\19use_treesitter\2\21show_end_of_line\2\31show_current_context_start\2\17context_char\6-#show_trailing_blankline_indent\1\25show_current_context\2\28show_first_indent_level\1\20indent_increase\3\1\1\5\0\0\6|\aÂ¦\bâ”†\bâ”Š\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2ä\a\0\0\6\0&\00034\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\n\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\2:\2\v\0013\2\f\0:\2\r\0013\2\17\0002\3\3\0003\4\14\0003\5\15\0:\5\16\4;\4\1\3:\3\18\0023\3\19\0:\3\20\0022\3\3\0003\4\21\0;\4\1\3:\3\22\0022\3\3\0003\4\23\0003\5\24\0;\5\2\4;\4\1\3:\3\25\0022\3\3\0003\4\26\0003\5\27\0:\5\28\0043\5\29\0:\5\30\0043\5\31\0:\5 \0043\5!\0:\5\"\4;\4\1\3:\3#\0023\3$\0:\3%\2:\2\30\1>\0\2\1G\0\1\0\14lualine_z\1\3\0\0\29require'scrollbar'.run()\rlocation\14lualine_y\fsymbols\1\0\4\thint\6H\tinfo\6I\twarn\6W\nerror\6E\22diagnostics_color\1\0\4\thint\19DiagnosticHint\tinfo\19DiagnosticInfo\twarn\19DiagnosticWarn\nerror\20DiagnosticError\rsections\1\5\0\0\nerror\twarn\tinfo\thint\fsources\1\3\0\0\20nvim_diagnostic\20nvim_diagnostic\1\2\3\0\16diagnostics\19always_visible\1\21update_in_insert\1\fcolored\2\14lualine_x\1\0\1\fcolored\2\1\2\0\0\rfiletype\14lualine_c\1\2\3\0\rfilename\20shorting_target\3\30\16file_status\2\tpath\3\0\14lualine_b\1\3\0\0\20b:gitsigns_head\22b:gitsigns_status\14lualine_a\1\0\0\fpadding\1\0\2\tleft\3\2\nright\3\1\1\2\0\0\tmode\15extensions\1\5\0\0\bfzf\14nvim-tree\rquickfix\20symbols-outline\foptions\1\0\0\23disabled_filetypes\1\4\0\0\aqf\vpacker\rNvimTree\25component_separators\1\0\2\tleft\bî‚µ\nright\bî‚·\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\1\0\2\ntheme\15tokyonight\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  mkdx = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/james/.local/share/nvim/site/pack/packer/opt/mkdx",
    url = "https://github.com/SidOfc/mkdx"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nest.nvim",
    url = "https://github.com/LionC/nest.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2–\2\0\0\5\0\f\0\0184\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\5\0003\4\4\0:\4\6\0033\4\a\0:\4\b\3:\3\t\2>\1\2\0017\1\n\0004\2\0\0%\3\v\0>\2\2\0=\1\0\1G\0\1\0%nvim-autopairs.rules.endwise-lua\14add_rules\14ts_config\vpython\1\2\0\0\fcomment\blua\1\0\0\1\2\0\0\vstring\1\0\4\27disable_in_visualblock\2\22ignored_next_char\v[%w%.]\rcheck_ts\2\21disable_in_macro\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/james/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17nvim_cmp_cfg\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2\1\0\0\3\0\4\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0)\1\0\0003\2\3\0>\0\3\1G\0\1\0\1\0\t\vhsl_fn\1\tmode\15background\nnames\2\bcss\2\vRRGGBB\2\vrgb_fn\2\rRRGGBBAA\1\vcss_fn\1\bRGB\2\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/james/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2Ô\4\0\0\4\0\15\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0003\3\a\0:\3\b\2:\2\t\0013\2\n\0:\2\v\0013\2\r\0003\3\f\0:\3\b\2:\2\14\1>\0\2\1G\0\1\0\23rename_action_keys\1\0\1\texec\t<CR>\1\3\0\0\n<C-c>\n<Esc>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\tquit\1\4\0\0\6q\n<Esc>\n<C-c>\1\0\5\16scroll_down\n<C-j>\vvsplit\6v\topen\6o\14scroll_up\n<C-k>\nsplit\6s\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\1\tsign\1\venable\1\1\0\t\28definition_preview_icon\tï”¸ \17border_style\nround\25rename_prompt_prefix\tâž¤ \26dianostic_header_icon\v[ï†ˆ ]\26finder_reference_icon\tïŒ‘ \29use_saga_diagnostic_sign\2\22max_preview_lines\3\f\21code_action_icon\tï ´ \27finder_definition_icon\tïŒ‘ \18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/james/.local/share/nvim/site/pack/packer/opt/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-nonicons"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-nonicons",
    url = "https://github.com/yamatsum/nvim-nonicons"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2Þ\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\tview\1\0\1\nwidth\b30%\24update_focused_file\1\0\2\15update_cwd\2\venable\2\16diagnostics\1\0\1\venable\2\1\0\4\15update_cwd\2\15auto_close\2\16open_on_tab\1\18hijack_cursor\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/one-nvim",
    url = "https://github.com/Th3Whit3Wolf/one-nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popui.nvim"] = {
    config = { "\27LJ\1\2y\0\0\3\0\b\0\v4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\4\0004\1\6\0%\2\a\0>\1\2\2:\1\5\0G\0\1\0\23popui.ui-overrider\frequire\vselect\aui\frounded\23popui_border_style\6g\bvim\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/popui.nvim",
    url = "https://github.com/hood/popui.nvim"
  },
  ["renamer.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0\n<Esc>\15nvim_input\bapi\bvim\1\1\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\a\0001\3\6\0:\3\b\2:\2\t\1>\0\2\1G\0\1\0\rmappings\n<C-c>\1\0\0\0\fpadding\1\0\0\1\0\4\btop\3\1\tleft\3\0\vbottom\3\1\nright\3\0\nsetup\frenamer\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/renamer.nvim",
    url = "https://github.com/filipdutescu/renamer.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\1\2p\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\vnested/QuickFixCmdPost,User LspDiagnosticsChanged\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\19mappings_style\rsandwich\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/surround.nvim",
    url = "https://github.com/blackCauldron7/surround.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  treesitter = {
    config = { "\27LJ\1\2ë\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\f\0\0\tbash\bcpp\fcomment\thtml\tjson\nlatex\blua\vpython\trust\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight", "TwilightEnable" },
    config = { "\27LJ\1\2Z\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fdimming\1\0\0\1\0\1\rinactive\2\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/james/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["which-key.nvim"] = {
    config = { '\27LJ\1\2÷\5\0\0\5\0%\0)4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\b\0003\3\3\0003\4\4\0:\4\5\0033\4\6\0:\4\a\3:\3\t\0023\3\n\0:\3\v\0022\3\0\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0003\4\18\0:\4\19\0033\4\20\0:\4\21\3:\3\22\0023\3\24\0003\4\23\0:\4\25\0033\4\26\0:\4\27\3:\3\28\0023\3\29\0:\3\30\0023\3 \0003\4\31\0:\4!\0033\4"\0:\4#\3:\3$\2>\1\2\1G\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\rwinblend\3\0\vborder\vsingle\19popup_mappings\1\0\2\14scroll_up\n<c-k>\16scroll_down\n<c-j>\nicons\1\0\3\ngroup\6+\14separator\bâžœ\15breadcrumb\aÂ»\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\19ignore_missing\1\14show_help\2\rtriggers\tauto\fpresets\1\0\a\6g\2\6z\2\fwindows\2\fmotions\2\bnav\2\17text_objects\2\14operators\2\rspelling\1\0\2\fenabled\1\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0' },
    loaded = true,
    path = "/home/james/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\19mappings_style\rsandwich\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: renamer.nvim
time([[Config for renamer.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0\n<Esc>\15nvim_input\bapi\bvim\1\1\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\a\0001\3\6\0:\3\b\2:\2\t\1>\0\2\1G\0\1\0\rmappings\n<C-c>\1\0\0\0\fpadding\1\0\0\1\0\4\btop\3\1\tleft\3\0\vbottom\3\1\nright\3\0\nsetup\frenamer\frequire\0", "config", "renamer.nvim")
time([[Config for renamer.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17nvim_cmp_cfg\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring('\27LJ\1\2÷\5\0\0\5\0%\0)4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\b\0003\3\3\0003\4\4\0:\4\5\0033\4\6\0:\4\a\3:\3\t\0023\3\n\0:\3\v\0022\3\0\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0003\4\18\0:\4\19\0033\4\20\0:\4\21\3:\3\22\0023\3\24\0003\4\23\0:\4\25\0033\4\26\0:\4\27\3:\3\28\0023\3\29\0:\3\30\0023\3 \0003\4\31\0:\4!\0033\4"\0:\4#\3:\3$\2>\1\2\1G\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\rwinblend\3\0\vborder\vsingle\19popup_mappings\1\0\2\14scroll_up\n<c-k>\16scroll_down\n<c-j>\nicons\1\0\3\ngroup\6+\14separator\bâžœ\15breadcrumb\aÂ»\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\19ignore_missing\1\14show_help\2\rtriggers\tauto\fpresets\1\0\a\6g\2\6z\2\fwindows\2\fmotions\2\bnav\2\17text_objects\2\14operators\2\rspelling\1\0\2\fenabled\1\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0', "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2\3\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\a\0\0\14gitcommit\thelp\rmarkdown\tbash\nshell\nFTerm\14char_list\1\0\b\19use_treesitter\2\21show_end_of_line\2\31show_current_context_start\2\17context_char\6-#show_trailing_blankline_indent\1\25show_current_context\2\28show_first_indent_level\1\20indent_increase\3\1\1\5\0\0\6|\aÂ¦\bâ”†\bâ”Š\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\1\2p\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\vnested/QuickFixCmdPost,User LspDiagnosticsChanged\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: treesitter
time([[Config for treesitter]], true)
try_loadstring("\27LJ\1\2ë\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\f\0\0\tbash\bcpp\fcomment\thtml\tjson\nlatex\blua\vpython\trust\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "treesitter")
time([[Config for treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2ä\a\0\0\6\0&\00034\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\n\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\2:\2\v\0013\2\f\0:\2\r\0013\2\17\0002\3\3\0003\4\14\0003\5\15\0:\5\16\4;\4\1\3:\3\18\0023\3\19\0:\3\20\0022\3\3\0003\4\21\0;\4\1\3:\3\22\0022\3\3\0003\4\23\0003\5\24\0;\5\2\4;\4\1\3:\3\25\0022\3\3\0003\4\26\0003\5\27\0:\5\28\0043\5\29\0:\5\30\0043\5\31\0:\5 \0043\5!\0:\5\"\4;\4\1\3:\3#\0023\3$\0:\3%\2:\2\30\1>\0\2\1G\0\1\0\14lualine_z\1\3\0\0\29require'scrollbar'.run()\rlocation\14lualine_y\fsymbols\1\0\4\thint\6H\tinfo\6I\twarn\6W\nerror\6E\22diagnostics_color\1\0\4\thint\19DiagnosticHint\tinfo\19DiagnosticInfo\twarn\19DiagnosticWarn\nerror\20DiagnosticError\rsections\1\5\0\0\nerror\twarn\tinfo\thint\fsources\1\3\0\0\20nvim_diagnostic\20nvim_diagnostic\1\2\3\0\16diagnostics\19always_visible\1\21update_in_insert\1\fcolored\2\14lualine_x\1\0\1\fcolored\2\1\2\0\0\rfiletype\14lualine_c\1\2\3\0\rfilename\20shorting_target\3\30\16file_status\2\tpath\3\0\14lualine_b\1\3\0\0\20b:gitsigns_head\22b:gitsigns_status\14lualine_a\1\0\0\fpadding\1\0\2\tleft\3\2\nright\3\1\1\2\0\0\tmode\15extensions\1\5\0\0\bfzf\14nvim-tree\rquickfix\20symbols-outline\foptions\1\0\0\23disabled_filetypes\1\4\0\0\aqf\vpacker\rNvimTree\25component_separators\1\0\2\tleft\bî‚µ\nright\bî‚·\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\1\0\2\ntheme\15tokyonight\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2–\2\0\0\5\0\f\0\0184\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\5\0003\4\4\0:\4\6\0033\4\a\0:\4\b\3:\3\t\2>\1\2\0017\1\n\0004\2\0\0%\3\v\0>\2\2\0=\1\0\1G\0\1\0%nvim-autopairs.rules.endwise-lua\14add_rules\14ts_config\vpython\1\2\0\0\fcomment\blua\1\0\0\1\2\0\0\vstring\1\0\4\27disable_in_visualblock\2\22ignored_next_char\v[%w%.]\rcheck_ts\2\21disable_in_macro\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2\1\0\0\3\0\4\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0)\1\0\0003\2\3\0>\0\3\1G\0\1\0\1\0\t\vhsl_fn\1\tmode\15background\nnames\2\bcss\2\vRRGGBB\2\vrgb_fn\2\rRRGGBBAA\1\vcss_fn\1\bRGB\2\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2Ô\4\0\0\4\0\15\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0003\3\a\0:\3\b\2:\2\t\0013\2\n\0:\2\v\0013\2\r\0003\3\f\0:\3\b\2:\2\14\1>\0\2\1G\0\1\0\23rename_action_keys\1\0\1\texec\t<CR>\1\3\0\0\n<C-c>\n<Esc>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\tquit\1\4\0\0\6q\n<Esc>\n<C-c>\1\0\5\16scroll_down\n<C-j>\vvsplit\6v\topen\6o\14scroll_up\n<C-k>\nsplit\6s\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\1\tsign\1\venable\1\1\0\t\28definition_preview_icon\tï”¸ \17border_style\nround\25rename_prompt_prefix\tâž¤ \26dianostic_header_icon\v[ï†ˆ ]\26finder_reference_icon\tïŒ‘ \29use_saga_diagnostic_sign\2\22max_preview_lines\3\f\21code_action_icon\tï ´ \27finder_definition_icon\tïŒ‘ \18init_lsp_saga\flspsaga\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2c\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17watch_gitdir\1\0\0\1\0\1\rinterval\3€›î\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2Þ\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\1>\0\2\1G\0\1\0\tview\1\0\1\nwidth\b30%\24update_focused_file\1\0\2\15update_cwd\2\venable\2\16diagnostics\1\0\1\venable\2\1\0\4\15update_cwd\2\15auto_close\2\16open_on_tab\1\18hijack_cursor\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\2F\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\vignore\a^$\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\1\2{\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\15dimensions\1\0\2\nwidth\4š³æÌ\t™³¦ÿ\3\vheight\4æÌ™³\6æÌ™ÿ\3\1\0\1\nblend\3\n\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: popui.nvim
time([[Config for popui.nvim]], true)
try_loadstring("\27LJ\1\2y\0\0\3\0\b\0\v4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\4\0004\1\6\0%\2\a\0>\1\2\2:\1\5\0G\0\1\0\23popui.ui-overrider\frequire\vselect\aui\frounded\23popui_border_style\6g\bvim\0", "config", "popui.nvim")
time([[Config for popui.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-luapad'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'mkdx'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
