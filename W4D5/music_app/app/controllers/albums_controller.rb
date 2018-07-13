class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create

    @band = Band.find_by(name: params[:album][:band])
    @bands = Band.all

    params[:album][:band_id] = @band.id

    @album = Album.new(album_params)

    if @album.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end

  end

  def show
    @album = Album.find(params[:id])
    @band = @album.band
    render :show

  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to bands_url
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @bands = Band.all
    @band = @album.band.name == params[:album][:band] ?
      @album.band : Band.find_by(name: params[:album][:band])
    params[:album][:band_id] = @band.id
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:erros] = @album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live?, :band_id)
  end
end
