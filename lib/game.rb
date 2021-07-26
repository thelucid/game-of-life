# frozen_string_literal: true

require File.expand_path('../lib/renderer', __dir__)

# Represents a game that evolves at a given interval.
class Game
  attr_reader :world, :renderer, :sleeper, :looper, :interval

  def initialize(
    world:,
    renderer: Renderer.new,
    sleeper: Kernel,
    looper: Kernel,
    interval: 0.1
  )
    @world = world
    @renderer = renderer
    @sleeper = sleeper
    @looper = looper
    @interval = interval
  end

  def start!
    looper.loop do
      renderer.render(world.grid)
      sleeper.sleep(interval)
      world.evolve!
    end
  end
end
