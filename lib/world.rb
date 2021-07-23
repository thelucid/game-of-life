# frozen_string_literal: true

require File.expand_path('../lib/being', __dir__)
require File.expand_path('../lib/life', __dir__)

# Represents an evolving world with retrieval of beings.
class World
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def evolve!
    @grid = height.times.map do |y|
      width.times.map do |x|
        Life.new(world: self, coord_x: x, coord_y: y).survive? ? 1 : 0
      end
    end
  end

  def at(coord_x, coord_y)
    Being.new(state: state_at(coord_x, coord_y))
  end

  private

  def width
    @width ||= grid.first.size
  end

  def height
    @height ||= grid.size
  end

  def state_at(coord_x, coord_y)
    outside?(coord_x, coord_y) || grid[coord_y][coord_x].zero? ? :dead : :alive
  end

  def outside?(coord_x, coord_y)
    coord_x.negative? || coord_x >= width || coord_y.negative? || coord_y >= height
  end
end
