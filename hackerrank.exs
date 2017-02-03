#These solutions assume lists delimited by new lines from stdin



#Adds all odd numbers of a list of inputs
String.split(IO.read(:stdio, :all), "\n")
|> (&Enum.map(&1, fn n -> String.to_integer n end)).()
|> (&Enum.reduce(&1,0, fn n, acc -> acc + n*abs(rem(n,2)) end )).()
|> IO.puts


#Filters out numbers in a list at odd positions
defmodule List do
        def filter([n|tail], 1), do: (IO.puts n; filter(tail, 0))
        def filter([_|tail], 0), do: filter(tail, 1)
        def filter([], _), do: nil
    end

List.filter(String.split(IO.read(:stdio, :all), "\n"),0)


#Reverses a list without elixir's reverse operation
 list = String.split(IO.read(:stdio, :all), "\n")
 rev = fn
          [n|tail], fun ->  (fun.(tail, fun); IO.puts n)
          [],_ -> nil
       end

 rev.(list, rev)

#Prints a list from 1 to n. n is passed in from stdin
list = Enum.into 1..elem((IO.read(:stdio, :line) |> Integer.parse),0), []
str = Enum.map(list, fn(n) -> if n == List.last(list), do: "#{n}", else: "#{n}, " end)
IO.puts "[#{str}]"
