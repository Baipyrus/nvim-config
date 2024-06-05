-- Run currently open go file using Overseer
return {
  name = 'go run file',
  builder = function(_)
    return {
      cmd = 'go run ${file}',
    }
  end,
  condition = { filetype = 'go' },
}
