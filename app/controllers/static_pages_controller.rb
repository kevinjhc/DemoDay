class StaticPagesController < ApplicationController
  def index
    @startups = Startup.all
  end

  def map
  end
end
