# frozen_string_literal: true

require File.expand_path('./test_helper', __dir__)
require File.expand_path('../lib/being', __dir__)

class BeingTest < Minitest::Test
  def test_can_know_state
    assert_equal :dead, Being.new(state: :dead).state
    assert_equal :alive, Being.new(state: :alive).state
  end

  def test_can_know_if_dead
    assert_equal true, Being.new(state: :dead).dead?
    assert_equal false, Being.new(state: :alive).dead?
  end

  def test_can_know_if_alive
    assert_equal true, Being.new(state: :alive).alive?
    assert_equal false, Being.new(state: :dead).alive?
  end
end
