return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
      highlight = {
        "IndentBlanklineChar",
      },
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    -- 색상을 아주 연하게 설정
    vim.cmd [[highlight IndentBlanklineChar guifg=#2a2a2a gui=nocombine]]
  end
}
