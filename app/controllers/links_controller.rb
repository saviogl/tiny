class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update]
  before_action :link_params, only: [:create]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(@params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
        format.js
      else
        format.html { redirect_to root_path, notice: @link.errors }
        format.json { render json: @link.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # # DELETE /links/1
  # # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      @params = params.require(:link).permit(:original)
    end
end
