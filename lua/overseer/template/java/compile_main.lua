local utils = require 'custom.utils.java'

-- Compile project from `Main` entrypoint
return {
  name = 'Compile Main',
  builder = function(_)
    local classpaths = utils.get_classpaths()
    local cp = table.concat(classpaths, ':')

    -- TODO: Auto-detect file and path to `Main` entrypoint???
    -- FIX: Broken because of '.' classpath when it should be 'src'
    return {
      cmd = 'javac -cp "' .. cp .. '" ./src/Main.java',
    }
  end,
  condition = { filetype = 'java' },
}
