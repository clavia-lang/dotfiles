# Neovim

Neovim has a built-in LSP client. There are several language servers used in the
configurations.

Language | Language Server                      | Installation
-------- | ------------------------------------ | ------------------------------
C/C++    | [clangd]                             | [Installation][install_clangd]
Lua      | [lua-language-server][luals]         | [Installation][install_luals]
Rust     | [rust-analyzer][rls2]                | [Installation][install_rls2]
Java     | [Eclipse JDT Language Server][jdtls] | [Installation][install_jdtls]

[clangd]: https://github.com/clangd/clangd
[install_clangd]: https://clangd.llvm.org/installation#installing-clangd
[luals]: https://github.com/LuaLS/lua-language-server
[install_luals]: https://luals.github.io/#neovim-install
[rls2]: https://github.com/rust-lang/rust-analyzer
[install_rls2]: https://rust-analyzer.github.io/manual.html#installation
[jdtls]: https://github.com/eclipse-jdtls/eclipse.jdt.ls
[install_jdtls]: https://github.com/eclipse-jdtls/eclipse.jdt.ls#installation

```console
$ sudo pacman -S clangd rust-analyzer lua-language-server
$ paru -S jdtls
```
