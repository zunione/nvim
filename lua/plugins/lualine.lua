return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    -- Variable for small window settings
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    -- Diagnostics: Not shown if small window
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      always_visible = false,
      cond = hide_in_width,
    }

    -- Git diff icon settings: Not shown if small window
    local diff = {
      'diff',
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        disabled_filetypes = { 'alpha', 'neo-tree' },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', diff, diagnostics},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'fugitive' }
    }
  end,
}
