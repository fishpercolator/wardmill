class Ward < ActiveRecord::Base
  validates :name, presence: true
  has_many :postcodes, dependent: :delete_all  
  
  # Returns all the datasets with their ward-specific rows
  def datasets
    Dataset.order(:name).map_h {|d| DataRow.where(ward: self, dataset: d)}
  end
  
end
