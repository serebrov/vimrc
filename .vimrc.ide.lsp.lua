local nvim_lsp = require('lspconfig')

local util = require('lspconfig/util')
local path = util.path

-- Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
local coq = require "coq" -- add this

-- " python (pyright)
-- " npm i -g pyright
-- "
-- " bash
-- " npm i -g bash-language-server
-- "
-- " typescript
-- " npm install -g typescript typescript-language-server
-- "
-- " Vue
-- " npm install -g volar
-- "
-- local servers = { 'pyright', 'bashls', 'jsonls', 'tsserver', 'vuels', 'vimls' }
local servers = { 'pyright', 'bashls', 'jsonls', 'tsserver', 'volar', 'vimls' }

-- Global mappings. See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>fmt', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- Setup via nvim-lsp-installer.
-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function (server) 
--   server.setup(coq.lsp_ensure_capabilities({
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }))
-- end)

-- Setup without nvim-lsp-installer.
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }))
end

-- require'py_lsp'.setup {
--   -- This is optional, but allows to create virtual envs from nvim
--   -- host_python = "/path/to/python/bin"
--   on_attach = on_attach,
-- }

-- -- venv support for pyright
-- -- See https://github.com/neovim/nvim-lspconfig/issues/500
-- local function get_python_path(workspace)
--   -- Use activated virtualenv.
--   if vim.env.VIRTUAL_ENV then
--     return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
--   end

--   -- Find and use virtualenv from pipenv in workspace directory.
--   local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
--   if match ~= '' then
--     local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
--     return path.join(venv, 'bin', 'python')
--   end

--   -- Fallback to system Python.
--   return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
-- end

-- require'lspconfig'.pyright.setup(coq.lsp_ensure_capabilities({
--     -- on_attach = function()
--     --     require'lsp_signature'.on_attach {
--     --         hint_enable = false,
--     --     }
--     -- end,
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     },
--     on_init = function(client)
--         client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
--     end
-- }))

-- " HTML
-- " npm i -g vscode-langservers-extracted
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.on_attach = on_attach

-- require'lspconfig'.html.setup {
--   capabilities = coq.lsp_ensure_capabilities(capabilities),
-- }

-- For Plug 'nvim-treesitter/nvim-treesitter'
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "vue",
    "python",
    "json",
    "html",
    "scss",
    "yaml",
  },
  highlight = {
    -- additional_vim_regex_highlighting = false,
    -- custom_captures = {},
    -- disable = { "markdown" },
    enable = true,
  },
  incremental_selection = {
    disable = {},
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_decremental = "grm",
      node_incremental = "grn",
      scope_incremental = "grc"
    },
  },
  indent = {
    disable = {},
    enable = false,
  },
  matchup = {
    disable = {},
    enable = true,
  },
  -- Plug 'windwp/nvim-ts-autotag'
  autotag = {
    enable = true,
  }
}
