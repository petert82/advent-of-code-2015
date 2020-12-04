defmodule AdventTest do
  use ExUnit.Case
  doctest Advent

  test "calculates the correct floor" do
    assert Advent.calc_floor("(())") == 0
    assert Advent.calc_floor("()()") == 0
    assert Advent.calc_floor("(((") == 3
    assert Advent.calc_floor("(()(()(") == 3
    assert Advent.calc_floor("))(((((") == 3
    assert Advent.calc_floor("())") == -1
    assert Advent.calc_floor("))(") == -1
    assert Advent.calc_floor(")))") == -3
    assert Advent.calc_floor(")())())") == -3
  end
  
  test "calculates basement entry instruction" do
    assert Advent.calc_basement_entry(")") == 1
    assert Advent.calc_basement_entry("()())") == 5
    assert Advent.calc_basement_entry("()())(") == 5
  end
  
  test "calculates wrapping paper for 1 present" do
    assert Advent.calc_wrapping_paper("2x3x4") == 58
    assert Advent.calc_wrapping_paper("1x1x10") == 43
  end
end
