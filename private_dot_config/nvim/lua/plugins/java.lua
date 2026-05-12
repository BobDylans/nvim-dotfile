return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          inlayHints = { parameterNames = { enabled = "all" } },
          eclipse = { downloadSources = true },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          format = { enabled = true },
        },
        signatureHelp = { enabled = true },
      },
    },
  },
}
