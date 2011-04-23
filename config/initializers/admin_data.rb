
AdminData.config do |config|
  config.is_allowed_to_view = lambda {|controller| controller.send('admin_signed_in?') }
  config.is_allowed_to_update = lambda {|controller| controller.send('admin_signed_in?') }
end
