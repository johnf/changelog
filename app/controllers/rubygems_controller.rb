class RubygemsController < ApplicationController

  def show
    @rubygems = Rubygem.limit(5).where :name => params[:name]
    @latest = @rubygems.first
  end

end
