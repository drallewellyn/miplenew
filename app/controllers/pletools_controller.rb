class PletoolsController < ApplicationController
  
  before_action :find_pletool, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :tag_cloud

  def index
    if params[:tag].present? 
      @pletool = Pletool.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 4)
    else
      @pletools = Pletool.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
    end
  end

  def tag_cloud
    @tags = Pletool.tag_counts_on(:tags, :limit => 3, :order => "count desc")
  end
  
  def show
  end

  def new
    @pletool = Pletool.new
  end

  def edit
  end

  def create
    @pletool = Pletool.new(pletool_params)

    if @pletool.save
      redirect_to @pletool, notice: "Tool succesfully saved!"
    else
      render 'new', notice: "Try Again. I was unable to save your PLE Tool."
    end
  end

  def update
    
    if @pletool.update(params[:pletool].permit(:title, :description, :link, :image, :tag_list))
      redirect_to @pletool, notice: "PLE Tool succesfully edited!"
    else
      render 'edit'
    end
  end

  def destroy
    @pletool.destroy
    respond_to do |format|
      format.html { redirect_to pletools_url, notice: 'Ple Tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def pletool_params
      params.require(:pletool).permit(:title, :link, :description, :image_url, :slug, :tag_list)
    end

    def find_pletool
      @pletool = Pletool.friendly.find(params[:id])
    end

end
