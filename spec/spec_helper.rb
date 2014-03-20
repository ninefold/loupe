require_relative '../lib/loupe.rb'


RSpec.configure do |config|
  # config.include RSpec::Fire
  # config.treat_symbols_as_metadata_keys_with_true_values = true
  # config.alias_example_to :fit, focused: true
  # config.filter_run focused: true
  # config.run_all_when_everything_filtered = true
  # #config.around(:each, :vcr) do |example|
  #   #options       = {:record => example.metadata[:record], :match_requests_on => example.metadata[:match_requests_on]}
  #   #cassette_dir  = example.metadata[:vcr_title] || ""
  #   #cassette_file = example.metadata[:description].gsub(/[^\w\/]+/, "_").downcase
  #   #cassette_path = File.join(cassette_dir, cassette_file)
  #   #VCR.use_cassette(cassette_path, options) { example.call }
  # #end
end