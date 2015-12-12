class BidsController < ApplicationController

  before_action :find_auction
  before_action :find_bid, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]


  def index
    @bids = Bid.order("created_at DESC")
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new bid_params
    @bid.auction_id = @auction.id
    @bid.user_id = current_user.id

     respond_to do |format|

       if @bid.save
         format.html { redirect_to auction_path(@auction)}
         format.js { render :ajax_create }
       else
         format.html { render 'auction/show' }
         format.js   { render :ajax_fail }
       end

     end
   end

  def show
    @bid = Bid.find params_id
  end

  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to auction_path(@bid.auction) }
      format.js   { render }
    end
  end

private

  def bid_params
    params.require(:bid).permit(:amount)
  end

  def find_bid
    @bid = Bid.find params[:id]
  end

  def find_auction
    @auction = Auction.find params[:auction_id]
  end

end
