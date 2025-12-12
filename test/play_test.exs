defmodule IOBehaviour do
  @callback gets(prompt :: String.t()) :: String.t()
  @callback puts(message :: any()) :: :ok
end

Mox.defmock(IOMock, for: IOBehaviour)

defmodule PlayTest do
  use ExUnit.Case
  alias Play
  import Rewire
  import Mox

  rewire(Play, IO: IOMock)

  test "scenario 1" do
    test_process = self()
    expect(IOMock, :gets, fn "$" -> "place 0,0,north" end)
    expect(IOMock, :gets, fn "$" -> "move" end)
    expect(IOMock, :gets, fn "$" -> "report" end)
    expect(IOMock, :puts, fn message -> send(test_process, message) end)
    expect(IOMock, :gets, fn "$" -> "exit" end)
    expect(IOMock, :puts, fn message -> send(test_process, message) end)
    Play.main([])
    assert_receive "0,1,NORTH"
    assert_receive "👋"
  end

  test "scenario 2" do
    test_process = self()
    expect(IOMock, :gets, fn "$" -> "place 0,0,north" end)
    expect(IOMock, :gets, fn "$" -> "left" end)
    expect(IOMock, :gets, fn "$" -> "report" end)
    expect(IOMock, :puts, fn message -> send(test_process, message) end)
    expect(IOMock, :gets, fn "$" -> "exit" end)
    expect(IOMock, :puts, fn message -> send(test_process, message) end)
    Play.main([])
    assert_receive "0,0,WEST"
    assert_receive "👋"
  end

  test "scenario 3" do
    test_process = self()
    expect(IOMock, :gets, fn "$" -> "place 1,2,EAST" end)
    expect(IOMock, :gets, fn "$" -> "move" end)
    expect(IOMock, :gets, fn "$" -> "move" end)
    expect(IOMock, :gets, fn "$" -> "left" end)
    expect(IOMock, :gets, fn "$" -> "move" end)
    expect(IOMock, :gets, fn "$" -> "report" end)
    expect(IOMock, :puts, fn message -> send(test_process, message) end)
    expect(IOMock, :gets, fn "$" -> "exit" end)
    expect(IOMock, :puts, fn message -> send(test_process, message) end)
    Play.main([])
    assert_receive "3,3,NORTH"
    assert_receive "👋"
  end
end
