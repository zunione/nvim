return {
  'Everblush/nvim',
  name = 'everblush',
  lazy = false, -- Enable theme with no delay
  priority = 1000, -- Again with minimum delay
  config = function()
    -- 세부 설정
    require('everblush').setup({
      override = {
        LineNr = { fg = '#5a6d7a' },
      },
      transparent_background = false,
      nvim_tree = {
        contrast = false,
      },
    })
    
    -- 테마 활성화
    vim.cmd('colorscheme everblush')
  end,
}
