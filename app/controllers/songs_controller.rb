class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_admin, only: [:index, :show]

  # GET /songs
  # GET /songs.json
  def index
    if params[:q].present?
      @songs = Song.search(params[:q])
    else 
      @songs = Song.all
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  def create
    @song = Song.new(song_params)
    if @song.save
       redirect_to @song, notice: 'Song was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /songs/1
  def update
    #respond_to do |format|
      if @song.update(song_params)
        redirect_to @song, notice: 'Song was successfully updated.'
      else
        render :edit
      end
    #end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
   # respond_to do |format|
      redirect_to songs_url, notice: 'Song was successfully destroyed.'
   # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:number, :title, :composer, :sopran, :alt, :tenor, :bass)
    end
end
