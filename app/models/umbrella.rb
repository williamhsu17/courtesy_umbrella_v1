class Umbrella < ApplicationRecord
  belongs_to :umbrella_holder, :polymorphic => true
  # belongs_to :locations, :counter_cache => true
  belongs_to :enterprises, :optional => true

  has_many :rent_histories

  scope :in_users, -> { where(:umbrella_holder_type => :User) }
  scope :in_stations, -> { where(:umbrella_holder_type => :Location) }

  #validates :umbrella_holder_id, :uniqueness => true, :if => :holder_is_user?

  #def holder_is_user?
  #  umbrella_holder_type == "User"
  #end
  validate :umbrella_user_uniqueness, :if => :rent_to_user?

  def umbrella_user_uniqueness
    if self.umbrella_holder.umbrella.present?
      errors.add(:message, "database doesn't allow one user to have two umbrella")
    end
  end

  def rent_to_user?
    self.umbrella_holder_type == "User"
  end
end
