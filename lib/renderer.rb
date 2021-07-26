# frozen_string_literal: true

# Represents the rendering of a grid using ascii.
class Renderer
  CLEAR = "\e[H\e[2J"

  attr_reader :printer

  def initialize(printer: Kernel)
    @printer = printer
  end

  def render(grid)
    ascii = grid.map { |row| row.join(' ') }.join("\n")
    printer.print "#{CLEAR}#{ascii}\n"
  end
end
