return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    -- 'nvim-tree/nvim-web-devicons', -- fancy icons
    'linrongbin16/lsp-progress.nvim', -- LSP loading progress
  },
  config = function()
    local juliana_lualine = {
      normal = {
        a = { fg = '#1A1B26', bg = '#5c99d6', gui = 'bold' },
        b = { fg = '#d8dee9', bg = '#2e353e' },
        c = { fg = '#d9d9d9', bg = '#303841' },
      },
      insert = {
        a = { fg = '#1A1B26', bg = '#99c794', gui = 'bold' },
      },
      visual = {
        a = { fg = '#1A1B26', bg = '#c695c6', gui = 'bold' },
      },
      replace = {
        a = { fg = '#1A1B26', bg = '#ec5f66', gui = 'bold' },
      },
      command = {
        a = { fg = '#1A1B26', bg = '#f9ae58', gui = 'bold' },
      },
    }

    local mode_map = {
      NORMAL = 'N', INSERT = 'I', VISUAL = 'V',
      ['V-LINE'] = 'VL', ['V-BLOCK'] = 'VB',
      REPLACE = 'R', COMMAND = 'C', SELECT = 'S',
      ['S-LINE'] = 'SL', ['S-BLOCK'] = 'SB', TERMINAL = 'TERMINAL',
    }

    require('lualine').setup({
      options = {
        theme = juliana_lualine,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str) return mode_map[str] or str end,
          },
        },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
          {
            'filename',
            file_status = true,      -- Displays file status (readonly status, modified status)
            newfile_status = false,  -- Display new file status (new file means no write after created)
            path = 4,                -- 0: Just the filename, 1: Relative path, 2: Absolute path, 4: Filename and parent dir
            symbols = {
              modified = '[+]',      -- Text to show when the file is modified
              readonly = '[-]',      -- Text to show when the file is readonly
            }
          },
          'lsp_progress', -- Display LSP loading progress (if using 'linrongbin16/lsp-progress.nvim')
        },
        lualine_x = { 'filetype', 'encoding', 'fileformat' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end
}
