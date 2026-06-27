return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    -- 使用 Java 21 运行 jdtls
    vim.list_extend(opts.cmd, {
      "--java-executable",
      "/usr/lib/jvm/java-21-openjdk/bin/java",
    })

    -- 合并 settings（避免覆盖 LazyVim 默认值）
    opts.settings = vim.tbl_deep_extend("keep", opts.settings or {}, {
      java = {
        eclipse = {
          downloadSources = true,
          classpathVariables = {
            ["M2_REPO"] = vim.fn.expand("~/.m2/repository"),
          },
        },
        maven = { downloadSources = true },
        inlayHints = { parameterNames = { enabled = "all" } },
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true },
        format = { enabled = true },
      },
      signatureHelp = { enabled = true },
    })
  end,
}
