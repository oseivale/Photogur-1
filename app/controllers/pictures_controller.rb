class PicturesController < ApplicationController

before_action :ensure_logged_in, except: [:show, :index]
before_action :load_picture, only: [:show, :edit, :update, :destroy]
before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

  def index
    month = 1.month.ago
    year = 1.year.ago
    @most_recent_pictures = Picture.most_recent_five
    @created_before = Picture.created_before(month)
    @pictures = Picture.all
    @pictures_created_in_year = Picture.pictures_created_in_year(year)
  end

  def show
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
  end

  def update

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

    @picture.destroy
    redirect_to "/pictures"
  end

  def ensure_user_owns_picture
    unless current_user == @picture.user_id
      flash[:alert] = "Please log in"
      redirect_to new_sessions_url
    end
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end


end
