-- ~/.config/nvim/lua/plugins/java.lua
return {
  "nvim-java/nvim-java",
  ft = { "java" }, -- solo carga en buffers java
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- Esto ya se encarga de detectar tu JDK desde JAVA_HOME o PATH
    require("java").setup({
      jdk = { auto_install = true },
    })

    -- LazyVim ya tiene un wrapper para lspconfig
    local lspconfig = require("lspconfig")

    lspconfig.jdtls.setup({
      settings = {
        java = {
          configuration = {
            runtimes = {
              { name = "JavaSE-24", path = "/usr/lib/jvm/java-24-openjdk/", default = true },
              { name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk/" },
              { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk/" },
            },
          },
        },
      },
    })
  end,
}
