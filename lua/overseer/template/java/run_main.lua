local utils = require 'custom.utils.java'

-- Run `Main` entrypoint of project
return {
  name = 'Run Main',
  builder = function(_)
    local classpaths = utils.get_classpaths()
    local cp = table.concat(classpaths, ':')

    -- TODO: Auto-detect file and path to `Main` entrypoint???
    -- NOTE: This works without compiling first?? Dunno why
    return {
      cmd = 'java -cp "' .. cp .. '" ./src/Main.java',
    }
  end,
  condition = { filetype = 'java' },
}
