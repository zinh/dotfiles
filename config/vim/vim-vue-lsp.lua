-- Config for Vue LSP with Typescript support. Neovim 0.11+
-- config follow instruction at:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/vue_ls.lua
-- https://github.com/yioneko/vtsls
-- https://github.com/vuejs/language-tools/wiki/Neovim
-- npm install @vue/language-server
-- npm install @vtsls/language-server
local vue_language_server_path = '/home/vinh/projects/personal/tsserver/node_modules/@vue/language-server'
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  cmd = {'/home/vinh/.anyenv/envs/nodenv/versions/24.4.0/bin/node', '/home/vinh/projects/personal/tsserver/node_modules/.bin/vtsls', '--stdio'},
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
        log = "verbose"
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'vue' },
}                      
local ts_ls_config = {
    cmd = {'/home/vinh/.anyenv/envs/nodenv/versions/24.4.0/bin/node', '/home/vinh/projects/personal/tsserver/node_modules/.bin/typescript-language-server', '--stdio'},
    init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

local vue_ls_config = {                                                                                                                             
  cmd = {'/home/vinh/.anyenv/envs/nodenv/versions/24.4.0/bin/node', '/home/vinh/projects/personal/tsserver/node_modules/.bin/vue-language-server', '--stdio'}
}
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.enable({'ts_ls', 'vue_ls'})
-- Example: Go to definition with gd
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

