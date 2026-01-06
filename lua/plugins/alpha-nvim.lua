return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local startify = require("alpha.themes.startify")
    -- available: devicons, mini, default is mini
    -- if provider not loaded and enabled is true, it will try to use another provider
    startify.file_icons.provider = "devicons"
    require("alpha").setup(
      startify.config
    )

    -- alpha 대시보드가 켜질 때(파일 타입이 'alpha'가 될 때) neo-tree도 같이 열기
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha", -- alpha 대시보드의 파일 타입
      group = vim.api.nvim_create_augroup("alpha_open_neotree", { clear = true }),
      callback = function()
        -- 'silent'는 Neotree를 연다는 메시지가 뜨지 않게 합니다.
        vim.cmd("silent Neotree")
      end,
    })
  end,
}
