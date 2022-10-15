# frozen_string_literal: true

require_relative "explore/version"

require "uri"

module Explore
  class Error < StandardError; end

  class URI
    def initialize(uri)
      @uri = ::URI.parse(uri)
    end

    def valid?
      !!(@uri.to_s =~ /\A#{::URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/)
    end

    def to_s
      @uri.to_s
    end
  end

  class Site
    attr_reader :uri, :status

    def initialize(uri, status)
      @uri = uri
      @status = status
    end
  end

  class Status
    def initialize(url)
      @url = url
    end
  end

  def self.new(input)
    url = validate(input)
    status = Status.new(url.to_s)
    Site.new(url, status)
  end

  def self.validate(url)
    URI.new(url).tap do |uri|
      unless uri.valid?
        raise Error, "Invalid URI"
      end
    end
  end
end
