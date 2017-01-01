class User < ApplicationRecord
  before_create :generate_authentication_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :umbrella, :as => :umbrella_holder
  has_many :rent_histories

  def borrow(umbrella)
    if self.umbrella
      umbrella.errors.add(:message, "this user already rent an umbrella")
      return :failed
    end

    umbrella_log = umbrella.rent_histories.new
    station = umbrella.umbrella_holder

    umbrella_log.start_location = station
    umbrella_log.start_time = Time.now

    station.umbrella_count -= 1

    umbrella.umbrella_holder = self
    umbrella_log.user = self

    if umbrella.save
      umbrella_log.is_returned = false
      umbrella_log.save!
      station.save!
      return :success
    else
      return :error
    end
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
    puts "generate authentication_token"
  end

    def self.get_fb_data(access_token)
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token } }

    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def get_fb_data
    j = RestClient.get "https://graph.facebook.com/v2.5/me", :params => { :access_token => self.fb_token, :fields => "id,name,email,picture" }
    JSON.parse(j)
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      #user.fb_raw_data = auth
      user.save!
     return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
     existing_user.fb_uid = auth.uid
     existing_user.fb_token = auth.credentials.token
     #existing_user.fb_raw_data = auth
     existing_user.save!
     return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.fb_raw_data = auth
    user.save!
    return user
  end
end
