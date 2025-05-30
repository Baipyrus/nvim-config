-- Disable the default highlight group
vim.g.conflict_marker_highlight_group = ''

-- Include text after begin and end markers
vim.g.conflict_marker_begin = '^<<<<<<< .*$'
vim.g.conflict_marker_end = '^>>>>>>> .*$'

-- Git conflict marker management plugin
return {
  {
    'rhysd/conflict-marker.vim',
    config = function()
      -- Highlight groups
      vim.cmd 'highlight ConflictMarkerBegin guibg=#2f7366'
      vim.cmd 'highlight ConflictMarkerOurs guibg=#2e5049'
      vim.cmd 'highlight ConflictMarkerTheirs guibg=#344f69'
      vim.cmd 'highlight ConflictMarkerEnd guibg=#2f628e'
      vim.cmd 'highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81'

      -- Read all lines in buffer, check if there is any conflict marker
      function git_conflict_detection()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        -- Check if strict regex is contained in any line
        local beginning = vim.fn.match(lines, vim.g.conflict_marker_begin)
        local ending = vim.fn.match(lines, vim.g.conflict_marker_end)
        local enabled = vim.diagnostic.is_enabled()
        local conflict = beginning > -1 or ending > -1
        if conflict and enabled then
          vim.diagnostic.enable(false)
        elseif not conflict and not enabled then
          vim.diagnostic.enable(true)
        end
      end

      -- Autocommand to disable diagnostics on buffer enter
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePre' }, {
        group = vim.api.nvim_create_augroup('git-conflict-lsp-disable', { clear = true }),
        callback = git_conflict_detection,
      })
    end,
  },
}
