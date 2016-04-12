require 'open-uri'

class Dataset < ActiveRecord::Base
  has_many :data_rows, dependent: :delete_all
  
  def self.load_from_ldm(slug)
    res = CKAN::Package.find(name: slug).first.resources.first
    new do |ds|
      ds.name = slug
      CSV.new(open(res.url_safe), headers: true).each do |row|
        ward = DataRow.find_ward(row)
        if !ward
          warn "Unknown ward (#{row[0]})!"
          next
        end
        ds.data_rows << DataRow.new(ward: ward, row: row.to_s.encode('UTF-8', :invalid => :replace, :undef => :replace))
      end
    end
  end  
  
end
