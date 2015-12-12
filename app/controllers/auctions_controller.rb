class AuctionsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_auction, only: [:show, :edit, :update, :destroy]
  before_action :find_bid, only: [:show, :edit, :update, :destroy]

  def index
    @auctions = Auction.order("created_at DESC")
  end

  def new
    @auction = current_user.auctions.build
  end

  def create
    @auction = Auction.new auction_params
    if @auction.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update

    if @auction.update
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @auction.destroy
      redirect_to root_path
    else
      render 'index'
    end
  end

private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

  def find_bid
    @bid = Bid.find params[:id]
  end

end
