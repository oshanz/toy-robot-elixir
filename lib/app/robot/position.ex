defmodule App.Robot.Position do
  @type t :: %__MODULE__{
          x: integer(),
          y: integer(),
          facing: :NORTH | :EAST | :SOUTH | :WEST
        }

  defstruct x: 0, y: 0, facing: nil
end
