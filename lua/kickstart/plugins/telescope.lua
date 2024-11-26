-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      local actions = require 'telescope.actions'

      -- Find files parameters
      local find_command = {
        'rg',
        '--files',
        '--hidden',
        '-u',
        '-g',
        '!{' .. table.concat({
          '.git',
          'target',
          'node_modules',
          '.svelte-kit',
          'bin',
          'obj',
        }, ',') .. '}',
      }
      function attach_mappings(_, map)
        map('i', '<CR>', actions.select_default + actions.center)
        return true
      end

      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', function()
        builtin.find_files {
          -- This will ignore the directories you specified
          find_command = find_command,
          attach_mappings = attach_mappings,
        }
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', function()
        builtin.oldfiles {
          only_cwd = true,
        }
      end, { desc = '[S]earch [R]ecent Files in CWD' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Global Files' })
      vim.keymap.set('n', '<leader>sc', builtin.command_history, { desc = '[S]earch [C]ommand History' })
      vim.keymap.set('n', '<leader><leader>', function()
        builtin.buffers {
          sort_mru = true,
        }
      end, { desc = '[ ] Find existing buffers' })

      -- Telescope live_grep in git root
      -- Function to find the git root directory based on the current buffer's path
      local function find_git_root()
        -- Use the current buffer's path as the starting point for the git search
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_dir
        local cwd = vim.fn.getcwd()
        -- If the buffer is not associated with a file, return nil
        if current_file == '' then
          current_dir = cwd
        else
          -- Extract the directory from the current file's path
          current_dir = vim.fn.fnamemodify(current_file, ':h')
        end

        -- Find the Git root directory from the current file's path
        local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
        if vim.v.shell_error ~= 0 then
          print 'Not a git repository. Searching on current working directory'
          return cwd
        end
        return git_root
      end

      -- Custom live_grep function to search in git root
      local function live_grep_git_root()
        local git_root = find_git_root()
        if git_root then
          builtin.live_grep {
            search_dirs = { git_root },
          }
        end
      end

      vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

      -- Git file search
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files {
          -- This will ignore the directories you specified
          find_command = find_command,
          attach_mappings = attach_mappings,
          cwd = vim.fn.stdpath 'config',
        }
      end, { desc = '[S]earch [N]eovim files' })

      -- Telescope Git Pickers
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
      vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = '[G]it Buffer [C]ommits' })

      local function git_stash_mappings()
        builtin.git_stash {
          attach_mappings = function(_, map)
            -- builtin telescope modules
            local utils = require 'telescope.utils'
            local action_state = require 'telescope.actions.state'

            -- custom function to match stash index inside curly brackets
            local function match_bracket(str, arr)
              string.gsub(str, '{(.-)}', function(match)
                -- do not insert existing entry into index list
                if not vim.list_contains(arr, match) then
                  table.insert(arr, match)
                end
              end)
            end

            local function git_drop_stash(prompt_bufnr)
              local picker = action_state.get_current_picker(prompt_bufnr)
              local selection = picker:get_multi_selection()

              local stashes = {}
              -- scan all multi_selection entries
              for _, entry in ipairs(selection) do
                local value = entry.value
                match_bracket(value, stashes)
              end

              -- scan single selected entry
              local entry = action_state.get_selected_entry()
              if entry == nil and #stashes == 0 then
                -- reference: https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua#L589
                utils.__warn_no_selection 'actions.git_apply_stash'
                return
              end
              match_bracket(entry.value, stashes)

              local success = {}
              for idx = #stashes, 1, -1 do
                -- execute git command in os
                -- reference: https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua#L594
                local _, ret, stderr = utils.get_os_command_output { 'git', 'stash', 'drop', string.format('stash@{%d}', stashes[idx]) }
                if ret ~= 0 then
                  -- extracted from telescope.utils.notify:
                  vim.notify(
                    ---@diagnostic disable-next-line: param-type-mismatch
                    string.format("Error when dropping: stash@{%s}. Git returned: '%s'", stashes[idx], table.concat(stderr, ' ')),
                    vim.log.levels.ERROR,
                    { title = 'telescope.nvim' }
                  )
                  return
                end
                table.insert(success, stashes[idx])
              end

              -- extracted from telescope.utils.notify:
              vim.notify(string.format("dropping: 'stash@{%s}' ", table.concat(success, ', ')), vim.log.levels.INFO, { title = 'telescope.nvim' })

              -- refresh picker
              actions.close(prompt_bufnr)
              vim.schedule(git_stash_mappings)
            end
            map({ 'n', 'i' }, '<C-S-d>', git_drop_stash)
            return true
          end,
        }
      end
      vim.keymap.set('n', '<leader>gS', git_stash_mappings, { desc = '[G]it [S]tash' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
