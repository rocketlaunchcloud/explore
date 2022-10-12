# frozen_string_literal: true

require "test_helper"

class TestExplore < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Explore::VERSION
  end

  def test_requires_an_input
    assert_raises ArgumentError do
      Explore.new
    end
  end
end
