class Card < ActiveRecord::Base
  belongs_to :deck

  def name
    "#{self.face} of #{self.suit}"
  end
end
