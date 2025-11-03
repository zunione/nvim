return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    icons = {
      separator = { left = '│', right = '' },
      inactive = { separator = { left = '│', right = '' } },
    },

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,

    -- Sets the minimum padding width with which to surround each tab
    minimum_padding = 1,

    -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' },
    },
  },

  config = function(_, opts)
    require('barbar').setup(opts)

    -- 색상 설정
    local colors = {
      bg = '#1f1f1f',
      fg = '#ffffff',
      blue = '#51afef',
      orange = '#FF8800',
      gray = '#5c6370',
    }

    -- 현재 버퍼 (활성)
    vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = colors.fg, bg = colors.bg, bold = true })
    vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = colors.orange, bg = colors.bg })

    -- 비활성 버퍼
    vim.api.nvim_set_hl(0, 'BufferInactive', { fg = colors.gray, bg = '#181818' })
    vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = colors.orange, bg = '#181818' })

    -- 탭라인 배경
    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = '#181818' })

    -- 구분선
    vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = colors.blue, bg = colors.bg })
    vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = '#3e4452', bg = '#181818' })
  end,

  version = '^1.9.0', -- optional: only update when a new 1.x version is released
}
