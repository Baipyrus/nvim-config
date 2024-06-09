-- Run project in working directory using Overseer
return {
  name = 'go run',
  builder = function(_)
    return {
      cmd = 'go run .',
    }
  end,
  condition = { filetype = 'go' },
}
