return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    -- 使用 Java 21 运行 jdtls
    vim.list_extend(opts.cmd, {
      "--java-executable",
      "/usr/lib/jvm/java-21-openjdk/bin/java",
    })

    -- 设置 M2_REPO 类路径变量（Eclipse 项目文件用到它）
    if not opts.settings then
      opts.settings = {}
    end
    if not opts.settings.java then
      opts.settings.java = {}
    end
    if not opts.settings.java.eclipse then
      opts.settings.java.eclipse = {}
    end
    opts.settings.java.eclipse.classpathVariables = {
      ["M2_REPO"] = vim.fn.expand("~/.m2/repository"),
    }
  end,
}
