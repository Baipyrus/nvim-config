return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function()
      local mason_registry = require("mason-registry")
      local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
      return {
        -- How to find the root dir for a given filename. The default comes from
        -- lspconfig which provides a function specifically for java projects.
        root_dir = LazyVim.lsp.get_raw_config("jdtls").default_config.root_dir,

        -- How to find the project name for a given root dir.
        project_name = function(root_dir)
          return root_dir and vim.fs.basename(root_dir)
        end,

        -- Where are the config and workspace dirs for a project?
        jdtls_config_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
        end,
        jdtls_workspace_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
        end,

        -- How to run jdtls. This can be overridden to a full java command-line
        -- if the Python wrapper script doesn't suffice.
        cmd = {
          vim.fn.exepath("jdtls"),
          string.format("--jvm-arg=-javaagent:%s", lombok_jar),
        },
        full_cmd = function(opts)
          local fname = vim.api.nvim_buf_get_name(0)
          local root_dir = opts.root_dir(fname)
          local project_name = opts.project_name(root_dir)
          local cmd = vim.deepcopy(opts.cmd)
          if project_name then
            vim.list_extend(cmd, {
              "-configuration",
              opts.jdtls_config_dir(project_name),
              "-data",
              opts.jdtls_workspace_dir(project_name),
            })
          end
          return cmd
        end,

        -- These depend on nvim-dap, but can additionally be disabled by setting false here.
        dap = { hotcodereplace = "auto", config_overrides = {} },
        dap_main = {},
        test = true,
        settings = {
          java = {
            project = (function()
              -- START SEARCH FOR PROCESSING --
              -- detect install path based on system
              local is_windows = vim.fn.has("win32") == 1
              local cmds = is_windows and {
                "(gcm processing.exe).source",
              } or {
                "whereis",
                "processing.exe",
              }

              -- run syscall and process output
              local output = vim.system(cmds, { text = true }):wait()
              local path = output.stdout or ""
              if not is_windows then
                -- on linux, get substr starting with path
                local start_idx = string.find(path, "/")
                path = (start_idx ~= nil) and string.sub(path, start_idx) or ""
              end

              -- for windows, remove backslashes
              path = string.gsub(path, "\\", "/")
              -- remove filename at end of path
              local end_idx = string.find(path, "/[^/]*$")
              path = string.sub(path, 1, end_idx)

              -- in case of chocolatey install, navigate to binaries
              local is_chocolatey = string.find(path, "chocolatey")
              if is_chocolatey then
                path = path .. "../lib/processing/tools/"
                -- list directories for program version
                cmds = is_windows
                    and {
                      "ls",
                      path,
                      "|select name",
                      "|Out-String",
                    }
                  or {
                    "ls",
                    "-l",
                    path,
                  }

                output = vim.system(cmds, { text = true }):wait()
                local version = string.match(output.stdout, "processing[^%s]*")
                path = path .. version
              end
              -- set path to processing-core library
              path = path .. "/core/library/core.jar"

              return {
                referencedLibraries = {
                  is_windows and string.gsub(path, "/", "\\") or path,
                },
              }
            end)(),
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
          },
        },
      }
    end,
  },
}
