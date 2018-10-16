class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except:[:index,:show]

  def index
    if params[:tag]
      @pins = Pin.tagged_with(params[:tag]).order("created_at DESC").page(params[:page])
      @user = current_user.id if user_signed_in?
    else
      @pins = Pin.all.order("created_at DESC").page(params[:page])
      @user = current_user.id if user_signed_in?
    end
  end

  def show
    @comments = @pin.comments.includes(:user)
  end

  def new
    @pin= current_user.pins.build
  end

  def create
    @pin=current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice:"Succesfully created a new Pin"
    else
      render'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "The Pin was successfully updated"
    else
      render'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def upvote
    @pin.upvote_from current_user
    redirect_to :back
  end


  private
  def pin_params
    params.require(:pin).permit(:title, :description,:user_id, :image, :tag_list)
  end

  def find_pin
    @pin=Pin.find(params[:id])
  end
end
