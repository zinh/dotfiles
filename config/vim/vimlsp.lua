-- config follow instruction at:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/vue_ls.lua
-- https://github.com/yioneko/vtsls
-- https://github.com/vuejs/language-tools/wiki/Neovim
-- npm install @vue/language-server
-- npm install @vtsls/language-server
local vue_language_server_path = '/home/deck/Projects/tsserver/node_modules/@vue/language-server'
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  cmd = {'/home/deck/.anyenv/envs/nodenv/versions/24.4.0/bin/node', '/home/deck/Projects/tsserver/node_modules/.bin/vtsls', '--stdio'},
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'vue' },
}                      
local vue_ls_config = {                                                                                                                             
  cmd = {'/home/deck/.anyenv/envs/nodenv/versions/24.4.0/bin/node', '/home/deck/Projects/tsserver/node_modules/.bin/vue-language-server', '--stdio'}
}
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable({'vtsls', 'vue_ls'})
