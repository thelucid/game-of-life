# frozen_string_literal: true

# Represents a sentient being with state.
class Being
  attr_reader :state

  def initialize(state:)
    @state = state
  end

  def alive?
    state == :alive
  end

  def dead?
    state == :dead
  end
end
