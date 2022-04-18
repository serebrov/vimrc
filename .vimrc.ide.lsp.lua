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
-- " npm install -g vls
-- "
-- local servers = { 'pyright', 'bashls', 'jsonls', 'tsserver', 'vuels', 'vimls' }
local servers = { 'bashls', 'jsonls', 'tsserver', 'vuels', 'vimls' }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable 'nvim-lua/completion-nvim'
  -- require'completion'.on_attach(client, bufnr)

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.get()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>fmt", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end


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

require'py_lsp'.setup {
  -- This is optional, but allows to create virtual envs from nvim
  -- host_python = "/path/to/python/bin"
  on_attach = on_attach,
}

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

require'lspconfig'.html.setup {
  capabilities = coq.lsp_ensure_capabilities(capabilities),
}

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
