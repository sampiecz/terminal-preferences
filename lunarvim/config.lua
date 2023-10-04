-- Vim
vim.g.ruby_host_prog = '/home/conch/.gem/bin/neovim-ruby-host'
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr" -- use treesitter folding
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
lvim.use_icons = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.bufferline.active = false


-- Plugins
lvim.plugins = {
  { "ThePrimeagen/harpoon" },
  --
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  },
  --
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
            ---@diagnostic disable-next-line: unused-local
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        }
      })
    end
  },
  --
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true,                     -- enable this plugin (the default)
        enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,            -- show stop reason when stopped for exceptions
        commented = false,                  -- prefix virtual text with comment string
        only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
        all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false,          -- clear virtual text on "continue" (might cause flickering when stepping)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        ---@diagnostic disable-next-line: undefined-doc-name
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        ---@diagnostic disable-next-line: undefined-doc-name
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        ---@diagnostic disable-next-line: undefined-doc-name
        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        ---@diagnostic disable-next-line: unused-local
        display_callback = function(variable, buf, stackframe, node, options)
          ---@diagnostic disable-next-line: undefined-field
          if options.virt_text_pos == 'inline' then
            ---@diagnostic disable-next-line: undefined-field
            return ' = ' .. variable.value
          else
            ---@diagnostic disable-next-line: undefined-field
            return variable.name .. ' = ' .. variable.value
          end
        end,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

        -- experimental features:
        all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end
  }

}


-- Debug Adapters
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { "/home/megasquid/.local/share/lvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}" },
  }
}


-- Debug Config
lvim.builtin.dap.ui.config.controls.icons = {
  pause = "",
  play = "",
  step_into = "",
  step_over = "",
  step_out = "",
  step_back = "",
  run_last = "",
  terminate = "",
  disconnect = "",
}
