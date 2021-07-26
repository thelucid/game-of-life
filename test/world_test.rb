# frozen_string_literal: true

require File.expand_path('./test_helper', __dir__)
require File.expand_path('../lib/world', __dir__)

class WorldTest < Minitest::Test
  def setup
    @world = World.new(
      [
        [0, 0, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 0, 0, 0],
        [0, 1, 1, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
      ]
    )
  end

  def test_can_evolve_beings
    10.times { @world.evolve! }

    assert_equal(
      [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1, 0, 0, 0],
        [0, 0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
      ],
      @world.grid
    )
  end

  def test_can_get_being_with_correct_state
    assert_equal false, @world.at(1, 1).alive?
    assert_equal true, @world.at(1, 1).dead?
    assert_equal true, @world.at(3, 1).alive?
    assert_equal false, @world.at(3, 1).dead?
  end

  def test_being_is_dead_if_outside_of_grid
    assert_equal true, @world.at(-1, 0).dead?
    assert_equal true, @world.at(0, -1).dead?
    assert_equal true, @world.at(9, 0).dead?
    assert_equal true, @world.at(0, 9).dead?
  end
end
