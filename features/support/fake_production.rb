# Sometimes we need to fake that a scenario is running in production mode
# This is a bit hackish try not to use it
Around('@production') do |scenario, block|
  original_env = ENV['RACK_ENV']
  ENV['RACK_ENV'] = 'production'
  block.call

  ENV['RACK_ENV'] = original_env
end
