defmodule DungeonTest do
  alias Dungeon.Princess
  alias Dungeon.Monster
  use ExUnit.Case
  doctest Dungeon

  test "greets the world" do
    princess = Princess.start()
    monster = Monster.start_link(3)
    Princess.attack(princess, monster)
    :timer.sleep(1)
    assert Monster.get_life(monster) == 1

    assert Process.alive?(princess)
    assert Process.alive?(monster)

    Process.flag(:trap_exit, true)
    Princess.attack(princess, monster)
    :timer.sleep(1)

    assert_receive {:EXIT, _, :dead_by_princess}

    Process.flag(:trap_exit, false)
    refute Process.alive?(monster)
  end
end
