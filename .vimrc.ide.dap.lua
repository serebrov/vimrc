-- https://github.com/mfussenegger/nvim-dap-python

local dap = require('dap')

-- table.insert(dap.configurations.python, {
--   type = 'python',
--   request = 'launch',
--   name = 'My custom launch configuration',
--   program = '${file}',
--   -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
-- })

require('dap-python').setup('~/.vim/dap-adapters/venv-debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

-- See ~/.vim/dap-adapters/setup.sh
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.vim/dap-adapters/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/.vim/dap-adapters/vscode-chrome-debug/out/src/chromeDebug.js"}
}
dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.vim/dap-adapters/vscode-firefox-debug/dist/adapter.bundle.js'},
}

-- dap.configurations.javascript = {
--
-- }
dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Debug test',
    type = 'node2',
    request = 'launch',
    -- program = '${workspaceFolder}/npm run-script test:unit-debug ${file}',
    runtimeExecutable = "npm",
    runtimeArgs = {"run-script", "test:unit-debug", "${file}},
    port = 9000,
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
  {
   type = "chrome",
   runtimeExecutable = "/Users/seb/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
   request = "launch",
   name = "vuejs: chrome",
   url = "http://localhost:8080",
   webRoot = "${workspaceFolder}/src",
   breakOnLoad = true,
   -- sourceMapPathOverrides = {
   --   "webpack:///./src/*" = "${webRoot}/*"
   -- }
 },
 {
   type = "chrome",
   runtimeExecutable = "/Users/seb/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
   request = "launch",
   name = "vuejs: chrome: dev",
   url = "https://dev.shortform.com",
   webRoot = "${workspaceFolder}/src",
   breakOnLoad = true,
   -- sourceMapPathOverrides = {
   --   "webpack:///./src/*" = "${webRoot}/*"
   -- }
 },
 {
   type = "firefox",
   request = "launch",
   name = "vuejs: firefox",
   url = "http://localhost:8080",
   webRoot = "${workspaceFolder}/src",
   pathMappings = { 
     { url = "webpack:///src/", path = "${webRoot}/" }
   }
 }
 }
