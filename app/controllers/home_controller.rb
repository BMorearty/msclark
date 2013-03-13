class HomeController < ApplicationController
  def index
    redirect_to controller: :courses
  end
end
