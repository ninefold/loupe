require 'spec_helper'

describe Loupe::Lens do

  let(:bad_gems) { %w{mysql2 rails_12factor sqlite3 sqlite3-ruby} }

  let(:gemfile) {
    <<-GEMFILE
    source 'https://rubygems.org'
    gem 'rails', '4.0.3'

    group :production do
      gem 'mysql2'
      gem 'rails_12factor'
    end
    group :test do
      gem 'rspec-rails'
      gem 'sqlite3'
    end
    GEMFILE
  }

  let(:lens)     { Loupe::Lens.new(gemfile, bad_gems) }

  it "finds the bad gems" do
    expect(lens.analyse).to eq %w{mysql2 rails_12factor}
  end

  it "finds the dependencies" do
    expect(lens.dependencies.collect(&:name)).to eq %w{rails mysql2 rails_12factor rspec-rails sqlite3}
  end

  describe "loading gemfile" do
    let(:path) { File.dirname(__FILE__).gsub('spec','Gemfile') }
    let(:lens) { Loupe::Lens.new(path, bad_gems) }

    it "loads from path" do
      expect(lens.gemfile).to include "source 'https://rubygems.org'"
    end
  end
end