defmodule App.Robot.Turn do
  alias App.Robot.Position

  def left(%Position{facing: facing} = position) do
    faced = %{:NORTH => :WEST, :WEST => :SOUTH, :SOUTH => :EAST, :EAST => :NORTH}[facing]
    %Position{position | facing: faced}
  end

  def right(%Position{facing: facing} = position) do
    faced = %{:NORTH => :EAST, :EAST => :SOUTH, :SOUTH => :WEST, :WEST => :NORTH}[facing]
    %Position{position | facing: faced}
  end
end
