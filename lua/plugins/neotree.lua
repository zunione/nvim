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

    filesystem = {
      filtered_items = {
        visible = true,
        dotfiles = false, -- .으로 시작하는 파일 항상 보기
        git_ignored = false, -- gitignore된 파일 항상 보기
      }
    },

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

    vim.cmd([[
      highlight NeoTreeGitModified guifg=#E2C08D 
      highlight NeoTreeGitUntracked guifg=#73C991
      highlight NeoTreeGitAdded guifg=#73C991
      highlight NeoTreeGitDeleted guifg=#E06C75
      highlight NeoTreeGitConflict guifg=#E06C75

      highlight NeoTreeDotFile guifg=#8C8C8C
      highlight NeoTreeFilteredItem guifg=#8C8C8C
    ]])
  end,
}
