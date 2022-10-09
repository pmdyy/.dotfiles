local null_ls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.formatting_sync({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

return require("null-ls").setup({
  sources = {
    null_ls.builtins.formatting.deno_fmt,
    null_ls.builtins.formatting.prettier.with {
      disabled_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    }, -- use deno instead
    null_ls.builtins.formatting.stylua.with {
      extra_args = { '--config-path', vim.fn.expand '~/.stylua.toml' },
    },
    null_ls.builtins.formatting.shfmt.with {
      extra_args = { '-i', '4' },
    },
    null_ls.builtins.diagnostics.gitlint.with {
      extra_args = { '--contrib=contrib-title-conventional-commits', '--ignore=body-is-missing' },
    },
    -- null_ls.builtins.diagnostics.vale,
  },
  on_attach = function(client, bufnr)
    if client.name == "null-ls" then                                                                                                   
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            -- vim.lsp.buf.formatting_sync()
            lsp_formatting(bufnr)
          end,
        })
      end
    end
  end,
})
