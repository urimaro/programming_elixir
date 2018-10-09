以下を使ってテストできる

- ExUnit
- Mix
- ESpec

テスト対象は以下のとおり

- Worker: Stash, Server  
    プロセスの各機能
- Supervisor: Supervisor, SubSupervisor  
    プロセスの再起動、停止？
    - プロセスを落として、1秒程度sleepした後で、ワーカーの機能を呼び出す
    - プロセスを落として、 `Process.whereis/1` でプロセスの有無を確認する
    - プロセスモニターで確認できる？

