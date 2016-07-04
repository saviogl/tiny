class MainController < ApplicationController
  def index
    @link = Link.new
    @URI_Not_Found = session[:uri_not_found]
    session[:uri_not_found] = nil
  end
end
