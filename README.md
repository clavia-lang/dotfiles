## shell

Starship用作跨shell提示词，Zoxide用于跨shell切换常用工作目录。

```console
$ pacman -S starship zoxide
```

Nushell中用fish的`complete`命令提供自动补全。
即使你只用Nushell，也需要安装fish。

```console
$ pacman -S fish
```

## Neovim

```console
$ pacman -S git
```

语言  | 语言伺服器
----- | -------------
C/C++ | clangd
Rust  | rust-analyzer
Zig   | ZLS 

```console
$ pacman -S clangd rust-analyzer zls
```
