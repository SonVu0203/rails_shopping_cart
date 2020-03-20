class ImagesController < ApplicationController

  def destroy
    @product_id = Image.find(params[:id]).imageable_id
    Image.find(params[:id]).destroy
    flash[:success] = "image is deleted"
    redirect_to product_path(@product_id)
  end
end
