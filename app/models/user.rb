class User < ActiveRecord::Base

  has_many :auctions
  has_many :bids
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
