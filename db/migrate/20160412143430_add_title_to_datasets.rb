class AddTitleToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :title, :string
  end
end
