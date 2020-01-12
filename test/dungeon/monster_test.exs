defmodule Dungeon.MonsterTest do
  use ExUnit.Case
  alias Dungeon.Monster

  test "spawn a monster" do
    monster = Monster.start_link(3)
    assert Process.alive?(monster)
  end

  test "monster can be attacked" do
    monster = Monster.start_link(3)
    Monster.attacked(monster, 2)
    assert Monster.get_life(monster) == 1
  end
end
