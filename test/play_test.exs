defmodule PlayTest do
  use ExUnit.Case

  test "scenario 1" do
    position = Robot.place(0, 0, "NORTH") |> Robot.move() |> Robot.report()
    assert position == "0,1,NORTH"
  end

  test "scenario 2" do
    position = Robot.place(0, 0, "NORTH") |> Robot.left() |> Robot.report()
    assert position == "0,0,WEST"
  end

  test "scenario 3" do
    position =
      Robot.place(1, 2, "EAST")
      |> Robot.move()
      |> Robot.move()
      |> Robot.left()
      |> Robot.move()
      |> Robot.report()

    assert position == "3,3,NORTH"
  end
end
