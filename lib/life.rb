# frozen_string_literal: true

# Represents life at a given coordinate within a world.
class Life
  NEAR = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]].freeze
  SURVIVE = { alive: 2..3, dead: 3..3 }.freeze

  attr_reader :world, :coord_x, :coord_y

  def initialize(world:, coord_x:, coord_y:)
    @world = world
    @coord_x = coord_x
    @coord_y = coord_y
  end

  def survive?
    SURVIVE[being.state].include?(neighbours.select(&:alive?).size)
  end

  private

  def being
    world.at(coord_x, coord_y)
  end

  def neighbours
    NEAR.map { |(move_x, move_y)| world.at(coord_x + move_x, coord_y + move_y) }
  end
end
