
AdminData.config do |config|
  config.column_settings = { 'Rubygem' => { :details => lambda{|model| model.details.inspect}}}

  # FIXME - Use real authentication
  #config.is_allowed_to_view = lambda {|controller| controller.send('logged_in?') }
  #config.is_allowed_to_update = lambda {|controller| controller.send('admin_logged_in?') }

  config.is_allowed_to_view = lambda {|controller| true }
  config.is_allowed_to_update = lambda {|controller| false }
end
