class QuickSizer < ActiveRecord::Base
def self.import(file)
    QuickSizer.delete_all
    CSV.foreach(file, headers: true) do |row|
        QuickSizer.create! row.to_hash
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
