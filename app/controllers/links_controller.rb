class LinksController < ApplicationController
  before_action :link_params, only: [:create]

  rescue_from ActionController::ParameterMissing do
    render :nothing => true, :status => 400
  end

  def show
    @link = Link.find_by_tinyfied(params[:tiny])
  end

  # POST /links
  def create
    @link = Link.new(@params)

    respond_to do |format|
      if @link.save
        format.json { render :create, status: :created }
        format.js { render :create }
      else
        format.json { render :errors, status: :unprocessable_entity }
        format.js { render :errors }
      end
    end
  end

  # GET /:tiny
  def redirect
    @link = Link.find_by_tinyfied(params[:tiny])
    if @link
      @link.clicks += 1
      @link.save
      redirect_to @link.original
    else
      redirect_to root_path
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      @params = params.required(:link).permit(:original)
    end
end
