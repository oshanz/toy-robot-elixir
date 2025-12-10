defmodule App.Robot.Move do
  alias App.Robot.{Position, Boundary}

  @x_min Boundary.x_min()
  @x_max Boundary.x_max()
  @y_min Boundary.y_min()
  @y_max Boundary.y_max()

  def move(%Position{y: y, facing: :NORTH} = position) when y < @y_max do
    %Position{position | y: y + 1}
  end

  def move(%Position{y: y, facing: :SOUTH} = position) when y > @y_min do
    %Position{position | y: y - 1}
  end

  def move(%Position{x: x, facing: :EAST} = position) when x < @x_max do
    %Position{position | x: x + 1}
  end

  def move(%Position{x: x, facing: :WEST} = position) when x > @x_min do
    %Position{position | x: x - 1}
  end

  def move(position) do
    position
  end
end
