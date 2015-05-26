class WikisController < ApplicationController
  
  def index
    @wikis = Wiki.all
  end
  
  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes(wiki_params)
    redirect_to wiki_path
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end
  
  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.create(wiki_params)
    redirect_to wikis_path(@wiki)
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
