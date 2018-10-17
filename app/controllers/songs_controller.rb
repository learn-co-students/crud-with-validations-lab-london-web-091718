class SongsController < ApplicationController

  before_action :set_song, only: [:show, :update, :edit, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)

    if @song.valid?
      redirect_to song_url(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_url(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.delete
    redirect_to songs_url
  end


  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
