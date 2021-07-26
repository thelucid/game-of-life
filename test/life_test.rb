# frozen_string_literal: true

require File.expand_path('./test_helper', __dir__)
require File.expand_path('../lib/world', __dir__)
require File.expand_path('../lib/life', __dir__)

class LifeTest < Minitest::Test
  def test_should_die_of_loneliness_with_1_live_neighbour
    world = World.new(
      [
        [0, 1, 0],
        [0, 1, 0],
        [0, 0, 0]
      ]
    )

    life = Life.new(world: world, coord_x: 1, coord_y: 1)

    assert_equal false, life.survive?
  end

  def test_should_survive_with_2_to_3_live_neighbours
    world = World.new(
      [
        [1, 1, 0],
        [0, 1, 0],
        [0, 0, 0]
      ]
    )

    life = Life.new(world: world, coord_x: 1, coord_y: 1)

    assert_equal true, life.survive?
  end

  def test_die_of_over_crowding_with_over_3_live_neighbours
    world = World.new(
      [
        [1, 1, 1],
        [0, 1, 0],
        [0, 0, 1]
      ]
    )

    life = Life.new(world: world, coord_x: 1, coord_y: 1)

    assert_equal false, life.survive?
  end

  def test_should_reserect_when_with_3_live_neighbours
    world = World.new(
      [
        [1, 1, 0],
        [0, 0, 1],
        [0, 0, 0]
      ]
    )

    life = Life.new(world: world, coord_x: 1, coord_y: 1)

    assert_equal true, life.survive?
  end

  def test_should_remain_dead_with_less_than_3_live_neighbours
    world = World.new(
      [
        [1, 1, 0],
        [0, 0, 0],
        [0, 0, 0]
      ]
    )

    life = Life.new(world: world, coord_x: 1, coord_y: 1)

    assert_equal false, life.survive?
  end
end
