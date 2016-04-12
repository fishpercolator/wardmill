class Ward < ActiveRecord::Base
  validates :name, presence: true
  has_many :postcodes, dependent: :delete_all  
end
