three_arity_fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

IO.puts "0, 0, 3 => #{three_arity_fizzbuzz.(0, 0, 3)}"
IO.puts "0, 2, 3 => #{three_arity_fizzbuzz.(0, 2, 3)}"
IO.puts "1, 0, 3 => #{three_arity_fizzbuzz.(1, 0, 3)}"
IO.puts "1, 2, 3 => #{three_arity_fizzbuzz.(1, 2, 3)}"
IO.puts "0, 0, 0 => #{three_arity_fizzbuzz.(0, 0, 0)}"

