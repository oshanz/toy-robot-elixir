defmodule Robot do
  @x_bounds 0..4
  @y_bounds 0..4
  @directions [:NORTH, :EAST, :SOUTH, :WEST]

  def place(x, y, _facing) when x not in @x_bounds or y not in @y_bounds do
    raise "Invalid position"
  end

  def place(x, y, facing) when is_binary(facing) do
    place(x, y, String.to_atom(facing))
  end

  def place(_x, _y, facing)
      when is_atom(facing) and facing not in @directions do
    raise "Invalid facing"
  end

  def place(x, y, facing) do
    %Position{x: x, y: y, facing: facing}
  end

  def move(%Position{facing: :NORTH} = position) do
    moved = %Position{position | y: position.y + 1}

    if valid_position?(moved) do
      moved
    else
      position
    end
  end

  def move(%Position{facing: :SOUTH} = position) do
    moved = %Position{position | y: position.y - 1}

    if valid_position?(moved) do
      moved
    else
      position
    end
  end

  def move(%Position{facing: :EAST} = position) do
    moved = %Position{position | x: position.x + 1}

    if valid_position?(moved) do
      moved
    else
      position
    end
  end

  def move(%Position{facing: :WEST} = position) do
    moved = %Position{position | x: position.x - 1}

    if valid_position?(moved) do
      moved
    else
      position
    end
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

  defp valid_position?(%Position{x: x, y: y}) when x in @x_bounds and y in @y_bounds do
    true
  end

  defp valid_position?(_), do: false

end
