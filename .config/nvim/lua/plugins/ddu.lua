vim.fn['ddu#custom#patch_global']({
  ui = 'ff',
  kindOptions = {
    action = {
      defaultAction = {
        'do'
      }
    },
    file = {
      defaultAction = {
        'open'
      }
    }
  },
  sources = {
    {
      name = {
        'file_external'
      }
    }
  },
  sourceParams = {
    file_external = {
      cmd = {
        'fd',
        '--type',
        'file',
        '--hidden',
        '--exclude',
        '.git',
      }
    }
  },
  sourceOptions = {
    _ = {
      converters = {
        'converter_hl_dir',
      },
      matchers = {
        'matcher_fzf',
      },
      sorters = {
        'sorter_fzf',
      },
    },
  },
  filterParams = {
    matcher_fzf = {
      highlightMatched = 'Search',
    }
  }
})

vim.fn['ddu#custom#patch_local']('git_status', {
  ui = 'ff',
  kindOptions = {
    file = {
      defaultAction = {
        'open'
      }
    }
  },
  sources = {
    {
      name = {
        'git_status'
      }
    }
  },
  sourceOptions = {
    _ = {
      converters = {
        'converter_hl_dir',
      },
      matchers = {
        'matcher_fzf',
      },
      sorters = {
        'sorter_fzf',
      },
    },
  },
  filterParams = {
    matcher_fzf = {
      highlightMatched = 'Search',
    }
  }
})

vim.fn['ddu#custom#patch_local']('file_old', {
  ui = 'ff',
  kindOptions = {
    file = {
      defaultAction = {
        'open'
      }
    }
  },
  sources = {
    {
      name = {
        'file_old'
      }
    }
  },
  sourceOptions = {
    _ = {
      converters = {
        'converter_hl_dir',
      },
      matchers = {
        'matcher_relative',
        'matcher_fzf',
      },
      sorters = {
        'sorter_fzf',
      },
    },
  },
  filterParams = {
    matcher_fzf = {
      highlightMatched = 'Search',
    }
  }
})

vim.fn['ddu#custom#patch_local']('buffers', {
  ui = 'ff',
  kindOptions = {
    file = {
      defaultAction = {
        'open'
      }
    }
  },
  sources = {
    {
      name = {
        'buffer'
      },
      params = {
        current = true
      }
    },
  },
  sourceOptions = {
    _ = {
      converters = {
        'converter_hl_dir',
      },
      matchers = {
        'matcher_fzf',
      },
      sorters = {
        'sorter_fzf',
      },
    },
  },
  filterParams = {
    matcher_fzf = {
      highlightMatched = 'Search',
    }
  }
})

vim.api.nvim_create_user_command('DduRgInput', function()
  vim.fn['ddu#start'] {
    ui = 'ff',
    kindOptions = {
      file = {
        defaultAction = {
          'open'
        }
      }
    },
    sources = {
      {
        name = 'rg',
        params = {
          input = vim.fn.input('search word: ')
        }
      }
    },
    sourceParams = {
      rg = {
        args = {
          '--column',
          '--hidden',
          '--no-heading',
          '--color',
          'never',
          '--sort',
          'path',
          '--glob',
          "!.git/*",
        }
      }
    },
    sourceOptions = {
      _ = {
        converters = {
          'converter_hl_dir',
        },
        matchers = {
          'matcher_fzf',
        },
        sorters = {
          'sorter_fzf',
        },
      },
    },
    filterParams = {
      matcher_fzf = {
        highlightMatched = 'Search',
      }
    }
  }
end, {nargs = 0})

vim.api.nvim_create_user_command('DduRgWord', function()
  vim.fn['ddu#start'] {
    ui = 'ff',
    kindOptions = {
      file = {
        defaultAction = {
          'open'
        }
      }
    },
    sources = {
      {
        name = 'rg',
        params = {
          input = vim.fn.expand('<cword>')
        }
      }
    },
    sourceParams = {
      rg = {
        args = {
          '--column',
          '--hidden',
          '--no-heading',
          '--color',
          'never',
          '--sort',
          'path',
          '--glob',
          "!.git/*",
        }
      }
    },
    sourceOptions = {
      _ = {
        converters = {
          'converter_hl_dir',
        },
        matchers = {
          'matcher_fzf',
        },
        sorters = {
          'sorter_fzf',
        },
      },
    },
    filterParams = {
      matcher_fzf = {
        highlightMatched = 'Search',
      }
    }
  }
end, {nargs = 0})

vim.api.nvim_create_user_command('DduFiler', function()
  vim.fn['ddu#start'] {
    ui = 'filer',
    resume = true,
    sync = true,
    sources = {
      {
        name = 'file'
      }
    },
    sourceOptions = {
      file = {
        columns = {
          'filename'
        },
        path = vim.fn.getcwd(),
        sorters = {
          'sorter_alpha'
        },
        converters = {
          'converter_git_status'
        },
      },
    },
  }
end, {nargs = 0})

local ff_win_width = math.floor(vim.o.columns * 0.8)
local ff_win_col = math.floor((vim.o.columns - ff_win_width) / 2)
vim.fn['ddu#custom#patch_global'] {
  uiParams = {
    ff = {
      startFilter = false,
      filterFloatingPosition = 'top',
      prompt = '>',
      split ='floating',
      floatingBorder = "rounded",
      winCol = ff_win_col,
      winRow = 3,
      winWidth = ff_win_width
    }
  }
}

local filer_win_width = math.floor(vim.o.columns * 0.25)
local filer_win_height = math.floor(vim.o.lines * 0.9)
vim.fn['ddu#custom#patch_global'] {
  uiParams = {
    filer = {
      split ='floating',
      floatingBorder = "rounded",
      winCol = 1,
      winRow = 1,
      winWidth = filer_win_width,
      winHeight = filer_win_height,
    }
  },
}

function ddu_my_settings()
  local opt = { noremap = true, buffer = true, silent = true }
  vim.keymap.set('n', '<CR>', [[<Cmd>call ddu#ui#do_action('itemAction')<CR>]], opt)
  vim.keymap.set('n', 'i',    [[<Cmd>call ddu#ui#do_action('openFilterWindow')<CR>]], opt)
  vim.keymap.set('n', 'q',    [[<Cmd>call ddu#ui#do_action('quit')<CR>]], opt)
end

function ddu_filter_my_settings()
  local opt = { noremap = true, buffer = true, silent = true }
  vim.keymap.set('i', '<CR>',  [[<ESC><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>]], opt)
  vim.keymap.set('i', '<ESC>', [[<ESC><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>]], opt)
  vim.keymap.set('i', 'jj',    [[<ESC><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>]], opt)
  vim.keymap.set('n', '<CR>',  [[<Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>]], opt)
end

function ddu_filer_my_settings()
  local openFunc = function()
    if vim.call('ddu#ui#get_item').isTree then
      return [[<Cmd>call ddu#ui#do_action('expandItem', {'mode': 'toggle'})<CR>]]
    else
      return [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open'})<CR>]]
    end
  end
  local openOpt = { noremap = true, buffer = true, expr = true }
  vim.keymap.set('n', 'o', openFunc, openOpt)

  local opt = { noremap = true, buffer = true }
  vim.keymap.set('n', 'q',     [[<Cmd>call ddu#ui#do_action('quit')<CR>]], opt)
  vim.keymap.set('n', '<C-r>', [[<Cmd>call ddu#ui#do_action('redraw')<CR>]], opt)
  -- vim.keymap.set('n', 'c',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'copy'})<CR>]], opt)
  -- vim.keymap.set('n', 'm',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'move'})<CR>]], opt)
  -- vim.keymap.set('n', 'p',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'paste'})<CR>]], opt)
  -- vim.keymap.set('n', 'r',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'rename'})<CR>]], opt)
  -- vim.keymap.set('n', 'N',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'newFile'})<CR>]], opt)
  -- vim.keymap.set('n', 'D',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>]], opt)
  -- vim.keymap.set('n', 'y',     [[<Cmd>call ddu#ui#do_action('itemAction', {'name': 'yank'})<CR>]], opt)
  vim.keymap.set('n', 'a',     [[<Cmd>call ddu#ui#do_action('chooseAction')<CR>]], opt)
  vim.keymap.set('n', '<CR>',  [[<Cmd>call ddu#ui#do_action('itemAction')<CR>]], opt)
end

local ddu_ff_groupname = 'ddu-ff-group'
vim.api.nvim_create_augroup(ddu_ff_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_ff_groupname,
  pattern = 'ddu-ff',
  callback = ddu_my_settings
})

local ddu_ff_filter_groupname = 'ddu-ff-filter-group'
vim.api.nvim_create_augroup(ddu_ff_filter_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_ff_filter_groupname,
  pattern = 'ddu-ff-filter',
  callback = ddu_filter_my_settings
})

local ddu_filer_groupname = 'ddu-filer-group'
vim.api.nvim_create_augroup(ddu_filer_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_filer_groupname,
  pattern = 'ddu-filer',
  callback = ddu_filer_my_settings
})

