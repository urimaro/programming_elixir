浮動小数点数を二つの10進数からなる文字列("3.13"のような)に変換する

```
> :io.format("The number is ~3.1f~n", [5.678])
The number is 5.7
:ok
```

オペレーティングシステムの環境変数を取り出す

```
> System.get_env
%{
  "Apple_PubSub_Socket_Render" => "/private/tmp/com.apple.launchd.5NDR0ysu4p/Render",
  "BINDIR" => "/usr/local/Cellar/erlang/20.2.4/lib/erlang/erts-9.2.1/bin",
  "DISPLAY" => "/private/tmp/com.apple.launchd.wcK8WItBqg/org.macosforge.xquartz:0",
  "EMU" => "beam",
  "HOME" => "/Users/goh",
  "LANG" => "ja_JP.UTF-8",
  "LOGNAME" => "goh",
  "NODENV_SHELL" => "zsh",
  "PATH" => "/usr/local/Cellar/erlang/20.2.4/lib/erlang/erts-9.2.1/bin:/usr/local/Cellar/erlang/20.2.4/lib/erlang/bin:/Users/goh/.nodenv/shims:/Users/goh/.pyenv/shims:/Users/goh/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/share/git-core/contrib/diff-highlight:/Users/goh/.nodenv/versions/6.11.2/bin",
  "PROGNAME" => "erl",
  "PWD" => "/Users/goh/elixir/programming_elixir",
  "PYENV_SHELL" => "zsh",
  "RBENV_SHELL" => "zsh",
  "ROOTDIR" => "/usr/local/Cellar/erlang/20.2.4/lib/erlang",
  "SHELL" => "/bin/bash",
  "SHLVL" => "1",
  "SSH_AUTH_SOCK" => "/private/tmp/com.apple.launchd.NNhAT6t1Np/Listeners",
  "TERM" => "xterm-256color",
  "TERM_PROGRAM" => "Apple_Terminal",
  "TERM_PROGRAM_VERSION" => "400",
  "TERM_SESSION_ID" => "AE376465-55B0-4021-88ED-BB53773C5AA5",
  "TMPDIR" => "/var/folders/08/07m313b1727gts1zbts8rfc40000gn/T/",
  "USER" => "goh",
  "XDG_CONFIG_HOME" => "/Users/goh/.config",
  "XPC_FLAGS" => "0x0",
  "XPC_SERVICE_NAME" => "0",
  "__CF_USER_TEXT_ENCODING" => "0x1F5:0x1:0xE"
}
```

ファイル名の拡張子を取り出す("dave/test.exs"なら、.exsを返す)

```
> Path.extname("~/elixir/programming_elixir/6.11.exs.md")
".md"
> Path.extname("~/elixir/programming_elixir/2.1.exs")
".exs"
```

プロセスのカレントワーキングディレクトリを返す

```
> System.cwd
"/Users/goh/elixir/programming_elixir"
```

JSON文字列を、Elixirのデータ構造に変換する(見つけるだけで、インストールしなくていい)

```
Poison
An incredibly fast, pure Elixir JSON library
https://github.com/devinus/poison
```

オペレーティングシステムのシェルでコマンドを実行する

```
> System.cmd "ls", []
{"2.1.exs\n2.2.exs\n2.3.exs\n2.4.exs\n3.3.exs\n3.4.exs\n4.2.exs.md\n4.4.exs.md\n4.5.exs.md\n4.6.exs.md\n4.7.exs.md\n5.0.exs.md\n5.1.exs.md\n5.2.exs.md\n5.3.exs.md\n5.4.exs.md\n6.1.exs.md\n6.10.exs.md\n6.11.exs.md\n6.12.exs.md\n6.2.exs.md\n6.3.exs.md\n6.4.exs.md\n6.5.exs.md\n6.6.exs.md\n6.7.exs.md\n6.8.exs.md\n6.9.exs.md\nbasic-types\nfirst_steps\nfunctions\nfunctions-1.exs.md\nfunctions-2.exs\nfunctions-3.exs\nfunctions-4.exs.md\nfunctions-5.exs.md\nintro\nmm\nmodules_and_functions-4.exs\nmodules_and_functions-4.exs.md\nmodules_and_functions-5.exs\nmodules_and_functions-5.exs.md\nmodules_and_functions-6_calling_2_arity_function.exs\nmodules_and_functions-6_calling_3_arity_functions.exs\nmodules_and_functions-7.exs.md\npattern_matching-1.exs\npattern_matching-2.exs\npattern_matching-3.exs\n",
 0}
> System.cmd "cat", ["/Users/goh/elixir/programming_elixir/2.1.exs"]
{"IO.inspect a = 1\n#=> 1\nIO.inspect 1 = a\n#=> 1\n#IO.inspect 2 = a\n#=> MatchError\n",
 0}
```

