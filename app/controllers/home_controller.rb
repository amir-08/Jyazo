class HomeController < ApplicationController
  def index

    @posts = Event.all
  end
 
end
