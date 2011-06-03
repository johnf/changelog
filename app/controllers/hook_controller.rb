class HookController < ApplicationController

  respond_to :json

  def rubygems
    @rubygem = Rubygem.new
    @rubygem.import_json request.raw_post

    if @rubygem.save
      flash[:notice] = "Registered gem."
      @rubygem.delay.fetch_changelog
    end

    # TODO log hook failures

    respond_with @rubygem, :location => '/'
  end

end
