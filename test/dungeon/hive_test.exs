defmodule Dungeon.HiveTest do
  alias Dungeon.Hive
  use ExUnit.Case
  # doctest Dungeon.Hive

  setup do
    # do someting to setup test

    on_exit(fn ->
      # do something when test exits
      nil
    end)
  end

  test "dummy test" do
    Hive.start_link()
    pid = Process.whereis(:hive)
    assert Process.alive?(pid)
  end
end
