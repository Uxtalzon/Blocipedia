class WikisController < ApplicationController
  
  def index
    @wikis = Wiki.visible_to(current_user)
    authorize @wikis
  end
  
  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.update_attributes(wiki_params)
    redirect_to wiki_path
  end
  
  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.destroy
    redirect_to wikis_path
  end
  
  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @wiki = current_user.wikis.create(wiki_params)
    authorize @wiki
    redirect_to wikis_path(@wiki)
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
