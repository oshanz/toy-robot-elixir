defmodule RobotTest do
  use ExUnit.Case

  alias App.Robot
  alias App.Robot.Position

  test "robot can be placed" do
    place = Robot.place(1, 1, "NORTH")
    assert %Position{x: 1, y: 1, facing: :NORTH} = place
  end

  test "robot can be moved" do
    moved = Robot.place(1, 1, "NORTH") |> Robot.move()
    assert %Position{x: 1, y: 2, facing: :NORTH} = moved
  end

  test "robot can be turned left" do
    turned = Robot.place(1, 1, "NORTH") |> Robot.left()
    assert %Position{x: 1, y: 1, facing: :WEST} = turned
  end

  test "robot can be turned right" do
    turned = Robot.place(1, 1, "NORTH") |> Robot.right()
    assert %Position{x: 1, y: 1, facing: :EAST} = turned
  end

  test "robot can report its position" do
    place = Robot.place(1, 1, "NORTH") |> Robot.report()
    assert place == "1,1,NORTH"
  end

  test "robot should not move off the table" do
    moved = Robot.place(1, 4, "NORTH") |> Robot.move()
    assert %Position{x: 1, y: 4, facing: :NORTH} = moved
  end
end
