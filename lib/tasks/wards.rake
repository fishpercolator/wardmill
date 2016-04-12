require 'open-uri'
require 'csv'

namespace :wards do
  desc 'Pull in the ward data from the OS CSVs'
  task :create => :environment do
    Ward.destroy_all
    wards = CKAN::Package.find(name: 'wards-in-leeds').first.resources.first.content_csv
    ward_codes = wards.inject({}) {|h, w| h.update(w[:ward_code] => Ward.create(name: w[:ward_name]))}
    CSV.foreach(Rails.root + 'vendor/lswfbd.csv') do |row|
      if ward = ward_codes[row[9]]
        ward.postcodes << Postcode.new(code: row[0].tr(' ', ''))
      end
    end
  end
end
