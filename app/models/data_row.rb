class DataRow < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :ward
  
  # Given a CSV row, find the right ward for it
  def self.find_ward(csvrow)
    if ward_column = csvrow.headers.find {|c| /^ward/i =~ c}
      ward_search = csvrow[ward_column].downcase.gsub('&', 'and')
      return Ward.where('lower(name) = ?', ward_search).first
    elsif postcode_column = csvrow.headers.find {|c| /^post[_ ]?code/i =~ c}
      postcode = csvrow[postcode_column]
      postcode.tr! ' ', ''
      return Postcode.find_by(code: postcode)&.ward
    end
  end
  
end
