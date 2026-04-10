local M = {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
}

M.config = function()
  local parsers = {
    'bash',
    'c',
    'comment',
    'css',
    'csv',
    'diff',
    'dockerfile',
    'gitignore',
    'go',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'markdown_inline',
    'nginx',
    'php',
    'python',
    'regex',
    'rust',
    'scss',
    'svelte',
    'sql',
    'templ',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'xml',
    'yaml',
    'zig',
  }

  require('nvim-treesitter').install(parsers)

  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then
        return
      end

      if not vim.treesitter.language.add(language) then
        return
      end

      vim.treesitter.start(buf, language)

      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

return M
