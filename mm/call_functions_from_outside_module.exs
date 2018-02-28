defmodule Outer do
  defmodule Inner do
    def inner_func do
      IO.puts "Here is inner_func"
    end
  end

  def outer_func do
    Inner.inner_func
    IO.puts "Here is outer_func"
  end
end

Outer.outer_func
Outer.Inner.inner_func

