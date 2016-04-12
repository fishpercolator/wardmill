class Postcode < ActiveRecord::Base
  belongs_to :ward
  validates :code, presence: true
end
