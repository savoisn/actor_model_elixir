defmodule Dungeon.PrincessTest do
  alias Dungeon.Princess
  use ExUnit.Case
  # doctest Dungeon.Princess

  setup do
    # do someting to setup test

    on_exit(fn ->
      # do something when test exits
      nil
    end)
  end

  test "spawning a princess" do
    pid = Princess.start()
    assert Process.alive?(pid)
    :timer.sleep(1)
    # refute Process.alive?(pid)
  end
end
