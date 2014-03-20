require "loupe/version"
require 'gemnasium/parser'

module Loupe

  class Lens
    attr_reader :bad_gems, :environments

    def initialize(gemfile, bad_gems, environments = nil)
      @gemfile = gemfile
      @bad_gems = bad_gems
      @environments = environments || default_environments
    end

    def default_environments
      [:production, :staging, :default]
    end

    def gemfile
      @gemfile.include?('/Gemfile') ? read_gemfile : @gemfile
    end

    def read_gemfile
      @gemfile = File.open(@gemfile, "rb").read
    end

    def analyse
      bad_gems.collect do |gem_name|
        gem_name if dependencies.detect { |dependency| is_bad_dependency?(dependency, gem_name) }
      end.compact
    end

    def dependencies
      @dependencies ||= Gemnasium::Parser::Gemfile.new(gemfile).dependencies
    end

    def is_bad_dependency?(dependency, gem_name)
      dependency.name == gem_name && (environments & dependency.groups).any?
    end

  end

end
