class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params) # post_images#new
    @post_image.user_id = current_user.id # deviseのヘルパーメソッド
    @post_image.save
    redirect_to post_images_path # post_images#index
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path # 一覧画面へ
  end


  private # createのストロングパラメータ

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
