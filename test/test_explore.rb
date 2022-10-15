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

  def test_returns_a_site_instance_with_valid_input
    site = Explore.new("https://www.google.com/")
    assert_equal site.class, Explore::Site
  end

  def test_requires_a_valid_http_uri
    assert_raises Explore::Error do
      Explore.new("ftp://www.google.com/")
    end
  end
end
