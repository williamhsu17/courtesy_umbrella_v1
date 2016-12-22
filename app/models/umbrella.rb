class Umbrella < ApplicationRecord
  belongs_to :umbrella_holder, :polymorphic => true
  # belongs_to :locations, :counter_cache => true
  belongs_to :enterprises, :optional => true

  has_many :rent_histories

  validates :umbrella_holder_id, :uniqueness => true, :if => :holder_is_user?

  def holder_is_user?
    umbrella_holder_type == "User"
  end
end
