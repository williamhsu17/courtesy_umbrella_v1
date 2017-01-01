class AdCase < ApplicationRecord
  belongs_to :enterprise
  has_many :umbrellas

  def umbrella_use_count
    use_count = 0
    self.umbrellas.each do |u|
      use_count = use_count + u.rent_count
    end
    return use_count
  end

  def pay_per_use
    use_count = self.umbrella_use_count
    # if use_count < self.umbrellas.size*10
    if use_count < 5
      return "tbd"
    else
      return self.case_amount / use_count
    end
  end
end
