defmodule Advent do
  def calc_floor(instructions) do
    instructions 
    |> String.codepoints
    |> Enum.reduce 0, fn
      ("(", floor) -> floor + 1
      (")", floor) -> floor - 1
    end
  end
  
  def calc_basement_entry(instructions) do
    instructions 
    |> String.codepoints
    |> Enum.reduce {1, 0}, fn
      (")", {idx, floor}) when floor == 0 -> idx
      ("(", {idx, floor}) -> {idx + 1, floor + 1}
      (")", {idx, floor}) -> {idx + 1, floor - 1}
      (_, idx) when is_integer(idx) -> idx
    end
  end
  
  def calc_wrapping_paper(size) when is_binary(size) do
    size 
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
    |> calc_wrapping_paper
  end
  def calc_wrapping_paper([l, w, h] = dims) do
    coverage = 2*l*w + 2*w*h + 2*h*l
    slack = dims |> Enum.sort |> Enum.sort |> Enum.take(2) |> Enum.reduce(fn(x, y) -> x*y end)
    coverage + slack
  end
end