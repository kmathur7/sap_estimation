class Component < ActiveRecord::Base
  def self.import(file)
    Component.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      Component.create! row.to_hash
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
