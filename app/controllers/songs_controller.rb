class SongsController < ApplicationController

  before_action :finder, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.create(params_song)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song.update(params_song)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def finder
    @song = Song.find(params[:id])
  end

  def params_song
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end



end
