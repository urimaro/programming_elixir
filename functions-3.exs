three_arity_fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

fizzbuzz = fn n -> three_arity_fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts "10 => #{fizzbuzz.(10)}"
IO.puts "11 => #{fizzbuzz.(11)}"
IO.puts "12 => #{fizzbuzz.(12)}"
IO.puts "13 => #{fizzbuzz.(13)}"
IO.puts "14 => #{fizzbuzz.(14)}"
IO.puts "15 => #{fizzbuzz.(15)}"
IO.puts "16 => #{fizzbuzz.(16)}"

