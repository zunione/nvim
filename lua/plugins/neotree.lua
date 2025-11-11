return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself

  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    enable_diagnostics = false,  -- Disable warning/error icons

    default_component_configs = {
      git_status = {
        symbols = {
          added = "●",
          modified = "●",
          deleted = "●",
          renamed = "●",
          untracked = "●",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "●",
        },
      },
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Git 색상 설정 (VSCode 스타일)
    vim.cmd([[
      highlight NeoTreeGitModified guifg=#E2C08D 
      highlight NeoTreeGitUntracked guifg=#73C991
      highlight NeoTreeGitAdded guifg=#73C991
      highlight NeoTreeGitDeleted guifg=#E06C75
      highlight NeoTreeGitConflict guifg=#E06C75
    ]])

    -- Nvim이 시작될 때 Neo-tree를 자동으로 엽니다.
    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      -- 중복 실행을 방지하기 위해 새 그룹 생성
      group = vim.api.nvim_create_augroup("neotree_on_startup", { clear = true }),
      callback = function()
        vim.cmd("Neotree")
      end
    })
  end,
}
