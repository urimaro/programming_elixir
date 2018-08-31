`/home/goh/elixir` で `iex` を起動

```
goh@goh% pwd
/Users/goh/elixir
goh@goh% iex --sname elixir
Erlang/OTP 21 [erts-10.0.6] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(elixir@goh)1> fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end
#Function<20.127694169/0 in :erl_eval.expr/5>
iex(elixir@goh)2> spawn(fun)
2015,.DS_Store,elixir,elixir_style_guide,2016,code_from_pragprog,elixir12-code.tgz,weather,issues,programming_elixir
#PID<0.109.0>
iex(elixir@goh)3> Node.spawn(:root@goh, fun)
#PID<11032.111.0>
,home,usr,.Spotlight-V100,net,.DS_Store,.PKInstallSandboxManager,.PKInstallSandboxManager-SystemSoftware,bin,installer.failurerequests,Network,sbin,.file,etc,var,Library,System,.OSInstallerMessages,.fseventsd,private,.DocumentRevisions-V100,.vol,Users,Applications,opt,dev,Volumes,tmp,cores
```

`/` で `iex` 起動

```
goh@goh% pwd
/
goh@goh% iex --sname root
Erlang/OTP 21 [erts-10.0.6] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(root@goh)1>
```

`ls` の結果

```
goh@goh% ls -la
total 240
drwxr-xr-x@  12 goh  staff     384  8 31 13:39 ./
drwxr-xr-x+  87 goh  staff    2784  8 31 13:38 ../
-rw-r--r--@   1 goh  staff    8196  8 31 13:40 .DS_Store
drwxr-xr-x    6 goh  staff     192  1 15  2018 2015/
drwxr-xr-x   24 goh  staff     768  1 15  2018 2016/
drwxr-xr-x@  28 goh  staff     896  8  7  2016 code_from_pragprog/
drwxr-xr-x   20 goh  staff     640  8 16 00:44 elixir/
-rw-r--r--@   1 goh  staff  106780  3  4 18:33 elixir12-code.tgz
drwxr-xr-x   11 goh  staff     352  4 28 15:21 elixir_style_guide/
drwxr-xr-x   15 goh  staff     480  8  5 18:39 issues/
drwxr-xr-x  188 goh  staff    6016  8 31 13:46 programming_elixir/
drwxr-xr-x   14 goh  staff     448  8 18 17:32 weather/
```

```
goh@goh% ls -la
total 61
drwxr-xr-x   31 root  wheel    992  7 11 04:15 ./
drwxr-xr-x   31 root  wheel    992  7 11 04:15 ../
-rw-rw-r--    1 root  admin  12292  7 23 18:47 .DS_Store
d--x--x--x    9 root  wheel    288  8 30 23:30 .DocumentRevisions-V100/
dr-xr-xr-t@   3 root  wheel     96 10 21  2016 .HFS+ Private Directory Data?/
-rw-r--r--    1 root  wheel   1188  7 11 04:15 .OSInstallerMessages
drwxr-xr-x    2 root  admin     64 10 21  2016 .PKInstallSandboxManager/
drwx------    2 root  admin     64  8 28 04:39 .PKInstallSandboxManager-SystemSoftware/
drwx------    5 root  wheel    160 10 21  2016 .Spotlight-V100/
----------    1 root  admin      0  2 16  2018 .file
drwx------  438 root  wheel  14016  8 31 13:39 .fseventsd/
drwxr-xr-x    2 root  wheel     64  4 13 02:34 .vol/
drwxrwxr-x+  82 root  admin   2624  8 30 23:35 Applications/
drwxr-xr-x+  66 root  wheel   2112  4 13 02:40 Library/
drwxr-xr-x    2 root  wheel     64  4 13 02:34 Network/
drwxr-xr-x@   4 root  wheel    128  3 28 11:59 System/
drwxr-xr-x    6 root  admin    192  4 13 02:34 Users/
drwxr-xr-x@   4 root  wheel    128  8 30 23:44 Volumes/
drwxr-xr-x@  38 root  wheel   1216  7 11 04:14 bin/
drwxrwxr-t    2 root  admin     64  4 13 02:34 cores/
dr-xr-xr-x    3 root  wheel   4489  8 30 23:30 dev/
lrwxr-xr-x@   1 root  wheel     11  4 13 02:33 etc@ -> private/etc
dr-xr-xr-x    2 root  wheel      1  8 31 00:12 home/
-rw-r--r--    1 root  wheel    313  2  7  2018 installer.failurerequests
dr-xr-xr-x    2 root  wheel      1  8 31 00:12 net/
drwxr-xr-x@   5 root  wheel    160  3 23 19:53 opt/
drwxr-xr-x    6 root  wheel    192  4 13 02:34 private/
drwxr-xr-x@  63 root  wheel   2016  7 11 04:14 sbin/
lrwxr-xr-x@   1 root  wheel     11  4 13 02:33 tmp@ -> private/tmp
drwxr-xr-x@  11 root  wheel    352  6  9 22:29 usr/
lrwxr-xr-x@   1 root  wheel     11  4 13 02:34 var@ -> private/var
```

