# frozen_string_literal: true

require File.expand_path('./test_helper', __dir__)
require File.expand_path('../lib/game', __dir__)

class GameTest < Minitest::Test
  def test_has_sensible_defaults
    game = Game.new(world: Object.new)

    assert_instance_of Renderer, game.renderer
    assert_equal Kernel, game.sleeper
    assert_equal Kernel, game.looper
    assert_equal 0.1, game.interval
  end

  def test_can_supply_custom_renderer
    renderer = Object.new
    game = Game.new(world: Object.new, renderer: renderer)

    assert_equal renderer, game.renderer
  end

  def test_can_supply_custom_sleeper
    sleeper = Object.new
    game = Game.new(world: Object.new, sleeper: sleeper)

    assert_equal sleeper, game.sleeper
  end

  def test_can_supply_custom_looper
    looper = Object.new
    game = Game.new(world: Object.new, looper: looper)

    assert_equal looper, game.looper
  end

  def test_can_supply_custom_interval
    game = Game.new(world: Object.new, interval: 0.5)

    assert_equal 0.5, game.interval
  end

  def test_can_create_game_loop
    world = Minitest::Mock.new
    world.expect(:grid, [[1, 1, 0], [0, 1, 0], [0, 1, 1]])
    world.expect(:evolve!, nil)

    sleeper = Minitest::Mock.new
    sleeper.expect(:sleep, nil, [0.5])

    renderer = Minitest::Mock.new
    renderer.expect(:render, nil, [[[1, 1, 0], [0, 1, 0], [0, 1, 1]]])

    game = Game.new(
      world: world,
      renderer: renderer,
      sleeper: sleeper,
      interval: 0.5,
      looper: Class.new { def loop(&block) = block.call }.new
    )

    game.start!

    assert_mock renderer
    assert_mock sleeper
    assert_mock world
  end
end
