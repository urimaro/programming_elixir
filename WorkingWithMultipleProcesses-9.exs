defmodule Grepper do
  def grep(scheduler) do
    send scheduler, {:ready, self()}
    receive do
      {:grep, file, client} ->
        send client, {:answer, file, count_cat(file), self()}
        grep(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp count_cat(file) do
    content = File.read!(file)
    Regex.scan(~r{cat}, content)
    |> length
  end
end

defmodule Scheduler do
  def run(num_processes, module, func, to_search) do
    (1..num_processes)
    |> Enum.map(fn (_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_search, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when queue != [] ->
        [next | tail] = queue
        send pid, {:grep, next, self()}
        schedule_processes(processes, tail, results)
      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      {:answer, file, result, _pid} ->
        schedule_processes(processes, queue, [{file, result} | results])
    end
  end
end

files = File.ls!(".")

#Enum.each [1, 2, 3, 4, 5, 10, 100, 1000, 10000], fn num_processes ->
Enum.each [1], fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, Grepper, :grep, files]
  )

  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n    #     time (s)"
  end
  :io.format "~5B     ~.4f~n", [num_processes, time/1000000.0]
end

