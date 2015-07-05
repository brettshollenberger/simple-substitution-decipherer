require "bundler"

Bundler.require(:default, :ci)

Dir[File.expand_path(File.join(__FILE__, "../../lib/**/*.rb"))].each { |f| require f }

RSpec.configure do |c|
  c.filter_run focus: true
  c.run_all_when_everything_filtered = true
end
