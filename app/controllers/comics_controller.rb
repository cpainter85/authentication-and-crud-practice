class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end
  def new
    @comic = Comic.new
  end
  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to comics_path, notice: 'Comic added!'
    else
      render :new
    end
  end
  def show
    @comic = Comic.find(params[:id])
  end
  def edit
    @comic = Comic.find(params[:id])
  end
  def update
    @comic = Comic.find(params[:id])
    if @comic.update(comic_params)
      redirect_to comic_path, notice: 'Comic was updated'
    else
      render :edit
    end
  end
  def destroy
    Comic.destroy(params[:id])
    redirect_to comics_path, notice: 'Comic was deleted'
  end
  private

  def comic_params
    params.require(:comic).permit(:title, :issue_number)
  end

end
