defmodule Play do


  def main(args) do
    args |> OptionParser.parse(switches: []) |> run()
  end

  defp run({[], _, []}) do
    IO.gets("Please provide a command") |> parse_command() |> run_command()
  end

  defp parse_command(command) do
    command
    |> String.split(" ")
    |> Enum.map(&String.trim/1)
  end

  defp run_command(["PLACE", x, y, facing]) do
    Robot.place(String.to_integer(x), String.to_integer(y), facing)
  end

  defp run_command(["MOVE"]) do
    Robot.move()
  end

  defp run_command(["LEFT"]) do
    Robot.left()
  end

  defp run_command(["RIGHT"]) do
    Robot.right()
  end

  defp run_command(["REPORT"]) do
    Robot.report()
  end

  defp run_command(_) do
    IO.puts("Invalid command")
  end
end
