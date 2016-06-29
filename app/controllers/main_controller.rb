class MainController < ApplicationController
  def index
    @link = Link.new
  end
end
