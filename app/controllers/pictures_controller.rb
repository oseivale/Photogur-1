class PicturesController < ApplicationController

before_action :ensure_logged_in, except: [:show, :index]

  def index
    month = 1.month.ago
    year = 1.year.ago
    @most_recent_pictures = Picture.most_recent_five
    @created_before = Picture.created_before(month)
    @pictures = Picture.all
    @pictures_created_in_year = Picture.pictures_created_in_year(year)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create

    @picture = Picture.new
    @picture.user = current_user
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to "/pictures"
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update

    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end



end
