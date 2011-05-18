class RubygemsController < ApplicationController

  def show
    @rubygems = Rubygem.where :name => params[:name]
    @latest = @rubygems.first
  end

end
