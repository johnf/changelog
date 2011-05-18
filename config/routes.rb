Changelog::Application.routes.draw do

  devise_for :users

  root :to => 'pages#home'

  post "hook/rubygems"

  match '/rubygems/:name' => 'rubygems#show', :as => :rubygem
end
