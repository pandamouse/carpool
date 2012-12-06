class Vehicle < ActiveRecord::Base

  belongs_to :user
  has_one :model

  scope :active,where(:retired_at => nil)

  def retire
    self.retired_at = Time.now
    self.save
  end
  
end
