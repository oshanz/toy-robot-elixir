defmodule App.Robot.Place do
  alias App.Robot.{Position, Boundary}

  @x_min Boundary.x_min()
  @x_max Boundary.x_max()
  @y_min Boundary.y_min()
  @y_max Boundary.y_max()
  @directions [:NORTH, :EAST, :SOUTH, :WEST]

  def place(x, y, _facing) when x not in @x_min..@x_max or y not in @y_min..@y_max do
    {:error, "Invalid Position"}
  end

  def place(x, y, facing) when is_binary(facing) do
    place(x, y, String.to_atom(facing))
  end

  def place(_x, _y, facing)
      when is_atom(facing) and facing not in @directions do
    {:error, "Invalid Position"}
  end

  def place(x, y, facing) do
    %Position{x: x, y: y, facing: facing}
  end
end
