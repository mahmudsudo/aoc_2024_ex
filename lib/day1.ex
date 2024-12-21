defmodule Day1 do
  def read_file_to_string(path) do
    case File.read(path) do
      {:ok, content} -> content
      {:error, reason } -> "Error reading file : #{reason}"
    end
  end
  def parse(line) do
    line
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end
  def combine_lists({left, right},{left_acc, right_acc}) do
    {[left | left_acc], [right | right_acc]}
  end
  def calculate_distance({left, right}) do
    left_sorted = Enum.sort(left)
    right_sorted = Enum.sort(right)
    Enum.zip(left_sorted, right_sorted)
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end
  def calculate_similarity({left, right}) do
    right_freq= Enum.frequencies(right)

    left
    |>Enum.map(fn x -> x * Map.get(right_freq, x, 0) end)
    |>Enum.sum()

  end

  def solve_part1() do
    read_file_to_string("input/day1.txt")
    |> String.split("\n")
    |> Enum.map(&parse/1)
    |> Enum.reduce({[], []}, &combine_lists/2)
    |> calculate_distance()
  end
  def solve_part2() do
    read_file_to_string("input/day1.txt")
    |> String.split("\n")
    |> Enum.map(&parse/1)
    |> Enum.reduce({[], []}, &combine_lists/2)
    |> calculate_similarity()
  end
end
