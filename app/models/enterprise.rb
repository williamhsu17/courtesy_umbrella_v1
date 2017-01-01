class Enterprise < ApplicationRecord
  has_many :ad_cases

  has_many :active_ad_cases, ->{ where(:is_active => true) }, :class_name => "AdCase"
end
