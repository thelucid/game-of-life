# frozen_string_literal: true

require File.expand_path('./test_helper', __dir__)
require File.expand_path('../lib/renderer', __dir__)

class RendererTest < Minitest::Test
  def test_has_sensible_defaults
    renderer = Renderer.new

    assert_equal Kernel, renderer.printer
  end

  def test_can_supply_custom_printer
    printer = Object.new
    renderer = Renderer.new(printer: printer)

    assert_equal printer, renderer.printer
  end

  def test_renders_with_ascii
    printer = Minitest::Mock.new
    printer.expect(:print, nil, ["\e[H\e[2J0 1 1\n0 1 0\n1 1 0\n"])

    renderer = Renderer.new(printer: printer)
    renderer.render([[0, 1, 1], [0, 1, 0], [1, 1, 0]])

    assert_mock printer
  end
end
