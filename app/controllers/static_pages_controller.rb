class StaticPagesController < ApplicationController
  def index
    @startups = Startup.find(:all, :order => 'presentation_order')
  end

  def map
  end
end
