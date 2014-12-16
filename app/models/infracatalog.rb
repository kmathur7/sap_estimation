class Infracatalog < ActiveRecord::Base
  def self.import(file)
    Infracatalog.delete_all
    CSV.foreach(file, headers: true) do |row|
        Infracatalog.create! row.to_hash
    end
  end
  
def self.as_csv
  CSV.generate do |csv|
    csv << column_names
    all.each do |item|
        csv << item.attributes.values_at(*column_names)
    end
  end
end
  
end
