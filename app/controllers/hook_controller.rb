class HookController < ApplicationController

  respond_to :json

  def rubygems
    @rubygem = Rubygem.new
    @rubygem.import_json request.raw_post

    flash[:notice] = "Registered gem." if @rubygem.save
    respond_with @rubygem, :location => '/'
  end

end
