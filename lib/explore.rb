# frozen_string_literal: true

require_relative "explore/version"

module Explore
  class Error < StandardError; end

  def self.new(input)
    @input = input
  end
end
