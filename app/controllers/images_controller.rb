class ImagesController < ApplicationController

  def new
    @gallery = find_gallery
    @image = @gallery.images.new
  end

  def create
    @gallery = find_gallery
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to gallery_image_path(@gallery, @image)
    else
      render :new
    end
  end

  def show
    @gallery = find_gallery
    @image = @gallery.images.find(params[:id])
  end

  def edit
    @gallery = find_gallery
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = find_gallery
    @image = @gallery.images.find(params[:id])

    if @image.update(image_params)
      redirect_to [@gallery, @image]
    else
      render :edit
    end
  end

  def destroy
    gallery = find_gallery
    image = gallery.images.find(params[:id])
    image.destroy

    redirect_to gallery
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :url)
  end

  def find_gallery
    Gallery.find(params[:gallery_id])
  end
end
