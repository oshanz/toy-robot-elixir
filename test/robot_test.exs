defmodule RobotTest do
  use ExUnit.Case

  test "robot can be placed" do
    place = Robot.place(1, 1, "NORTH")
    assert place.x == 1
    assert place.y == 1
    assert place.facing == :NORTH
  end

  test "robot can be moved" do
    moved = Robot.place(1, 1, "NORTH") |> Robot.move()
    assert moved.x == 1
    assert moved.y == 2
    assert moved.facing == :NORTH
  end

  test "robot can be turned left" do
    turned = Robot.place(1, 1, "NORTH") |> Robot.left()
    assert turned.x == 1
    assert turned.y == 1
    assert turned.facing == :WEST
  end

  test "robot can be turned right" do
    turned = Robot.place(1, 1, "NORTH") |> Robot.right()
    assert turned.x == 1
    assert turned.y == 1
    assert turned.facing == :EAST
  end

  test "robot can report its position" do
    place = Robot.place(1, 1, "NORTH") |> Robot.report()
    assert place == "1,1,NORTH"
  end
end
