class User < ActiveRecord::Base
  before_destroy :set_obsolete
  acts_as_authentic 

  has_many :vehicles

  def set_obsolete
    self.obsolete = true
    self.save
    false
  end
end
