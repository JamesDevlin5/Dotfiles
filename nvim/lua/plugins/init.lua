-- Plugins to load
--[[
TODO: Check if packer is downloaded already, and if not prompt the user
to install it

git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
]] require( "packer" ).startup( function()

  -- Manage thyself
  use{ "wbthomason/packer.nvim" }

  -- Color Schemes
  use{ "lvim-tech/lvim-colorscheme" } -- cmd="\<colorscheme\>.*"

  -- Tree Sitter
  use{
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require( "plugins.treesitter" )
    end,
  }

  use {
  "nvim-treesitter/nvim-tree-docs",
  disable = true,
  }

  -- Status Line
  use{
    "hoob3rt/lualine.nvim",
    config = function()
      require( "plugins.statusline" )
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
  -- Tab Line
  use{
    "romgrk/barbar.nvim",
    config = function()
      require( "plugins.tabline" )
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- File Explorer
  use{
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- UI
  use{ "lukas-reineke/indent-blankline.nvim" }
  use{ "glepnir/dashboard-nvim" }
  use{
    "folke/which-key.nvim",
    config = function()
      require( "plugins.which-key" )
    end,
  }
  use{
    't9md/vim-choosewin',
  }
  use{
    'rhysd/clever-f.vim',
  }

  -- Enhanced Editing
  use{ "mbbill/undotree", opt = true, cmd = { "UndotreeToggle" } }
  use{ "tpope/vim-surround" }
  use{ 'junegunn/vim-easy-align', opt = true, cmd = {'EasyAlign'}}
  use { 'junegunn/goyo.vim', opt = true, cmd = {'Goyo'}}
  use{ "svermeulen/vim-yoink", disable = true }
  use{ "vimwiki/vimwiki", ft = { "markdown" } }
  use{ 'kevinhwang91/nvim-bqf'}

  -- Fennel Support
  use{'bakpakin/fennel.vim', ft = { "fennel", "lisp" } }

  -- Fuzzy
  use{
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      require( "plugins.telescope" )
    end,
    cmd = { "Telescope" },
  }
  use{
    "pechorin/any-jump.vim",
    opt = true,
    cmd = { "AnyJump", "AnyJumpVisual", "AnyJumpBack", "AnyJumpLastResults" },
    config = function()
      require( "plugins.any-jump" )
    end,
  }
  -- TODO: make `function() require(...) end` a function

  -- TODO: make requires these two a function
  -- TODO: spectre config
  use{
    "windwp/nvim-spectre",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    opt = true,
  }

end )

require( "plugins.conf" )

--[[
  -- Remaining options to integrate (eventually...)
  local packer_dir = vim.fn.stdpath('data').."/pack/packer/start/packer.nvim"
  print(packer_dir)
  if vim.fn.empty(vim.fn.glob(packer_dir)) > 0 then
    vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_dir })
    vim.cmd 'packadd packer.nvim'
  end
  -- Plugin Config Table (`packer.use' function arguments):
  use {
    'myusername/example',        -- The plugin location string
    -- The following keys are all optional
    disable = boolean,           -- Mark a plugin as inactive
    as = string,                 -- Specifies an alias under which to install the plugin
    installer = function,        -- Specifies custom installer. See "custom installers" below.
    updater = function,          -- Specifies custom updater. See "custom installers" below.
    after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
    rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
    opt = boolean,               -- Manually marks a plugin as optional.
    branch = string,             -- Specifies a git branch to use
    tag = string,                -- Specifies a git tag to use
    commit = string,             -- Specifies a git commit to use
    lock = boolean,              -- Skip this plugin in updates/syncs
    run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
    requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
    rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
    config = string or function, -- Specifies code to run after this plugin is loaded.
    -- The setup key implies opt = true
    setup = string or function,  -- Specifies code to run before this plugin is loaded.
    -- The following keys all imply lazy-loading and imply opt = true
    cmd = string or list,        -- Specifies commands which load this plugin.
    ft = string or list,         -- Specifies filetypes which load this plugin.
    keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
    event = string or list,      -- Specifies autocommand events which load this plugin.
    fn = string or list          -- Specifies functions which load this plugin.
    cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
    module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                                 -- with one of these module names, the plugin will be loaded.
  }

]]
