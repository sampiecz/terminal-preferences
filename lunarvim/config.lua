-- Read the docs: https://www.lunarvim.org/docs/configuration


-- Vim
vim.g.ruby_host_prog = '/home/conch/.gem/bin/neovim-ruby-host'
vim.opt.guifont = "PragmataPro Mono Liga:h14" -- the font used in graphical neovim applications
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"                   -- use treesitter folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Mappings
lvim.builtin.which_key.mappings["h"] = {
  name = "Harpoon",
  s = { "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", "Show Menu" },
  m = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "Mark" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "Tests",
  t = { "<cmd>:lua require('neotest').run.run()<cr>", "Nearest test" },
  f = { "<cmd>:lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
  d = { "<cmd>:lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug" },
  o = { "<cmd>:luaorequire('neotest').output.open({ enter = true })<cr>", "Output" },
  p = { "<cmd>:lua require('neotest').output_panel.toggle()<cr>", "Panel" },
  s = { "<cmd>:lua require('neotest').summary.toggle()<cr>", "Summary" },
}


-- Lvim
lvim.transparent_window = true
lvim.format_on_save = {
  enabled = true
}

-- Plugins
lvim.plugins = {
  { "ThePrimeagen/harpoon" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        }
      })
    end
  }

}
