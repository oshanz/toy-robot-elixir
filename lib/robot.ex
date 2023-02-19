defmodule Robot do
  @x_min 0
  @x_max 4
  @y_min 0
  @y_max 4
  @directions [:NORTH, :EAST, :SOUTH, :WEST]

  def place(x, y, _facing) when x not in @x_min..@x_max or y not in @y_min..@y_max do
    raise "Invalid Position"
  end

  def place(x, y, facing) when is_binary(facing) do
    place(x, y, String.to_atom(facing))
  end

  def place(_x, _y, facing)
      when is_atom(facing) and facing not in @directions do
    raise "Invalid Direction"
  end

  def place(x, y, facing) do
    %Position{x: x, y: y, facing: facing}
  end

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

  def report(%Position{x: x, y: y, facing: facing}) do
    "#{x},#{y},#{facing}"
  end

  def left(%Position{facing: facing} = position) do
    faced = %{:NORTH => :WEST, :WEST => :SOUTH, :SOUTH => :EAST, :EAST => :NORTH}[facing]
    %Position{position | facing: faced}
  end

  def right(%Position{facing: facing} = position) do
    faced = %{:NORTH => :EAST, :EAST => :SOUTH, :SOUTH => :WEST, :WEST => :NORTH}[facing]
    %Position{position | facing: faced}
  end
end
