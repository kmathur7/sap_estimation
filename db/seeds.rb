# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Landscape.delete_all
Catalog.delete_all
QuickSizer.delete_all

Landscape.create!([
  {id: 1, name: "Production"},
  {id: 2, name: "Pre-Production"},
  {id: 3, name: "Development"},
  {id: 4, name: "Staging"},
  {id: 5, name: "Testing"}
  
  ])
Catalog.create!([
  {id: 1, name: "Bundle_A"},
  {id: 2, name: "Bundle_B"},
  {id: 3, name: "Bundle_C"}
  
  ])
QuickSizer.create!([
  {id: 1, catalog: "Bundle_A", product: "SAP ECC", platform: "ABAP", saps: 20000, memory: 64, io: 4000, iops: 5000, disksize: 1000},
  {id: 2, catalog: "Bundle_A", product: "SAP Content Server", platform: "STANDALONE", saps: 2000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 3, catalog: "Bundle_A", product: "NewWeaver", platform: "JAVA", saps: 7000, memory: 48, io: 2500, iops: 3000, disksize: 300},
  {id: 4, catalog: "Bundle_A", product: "Solution Manager", platform: "STANDALONE", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 5, catalog: "Bundle_B", product: "SAP ECC", platform: "ABAP", saps: 40000, memory: 128, io: 15000, iops: 16000, disksize: 1000},
  {id: 6, catalog: "Bundle_B", product: "SAP Content Server", platform: "STANDALONE", saps: 4000, memory: 16, io: 2500, iops: 3000, disksize: 300},
  {id: 7, catalog: "Bundle_B", product: "NetWeaver", platform: "JAVA", saps: 15000, memory: 64, io: 5000, iops: 6000, disksize: 300},
  {id: 8, catalog: "Bundle_B", product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 9, catalog: "Bundle_B", product: "Process Integration", platform: "ABAP+JAVA", saps: 4000, memory: 32, io: 4000, iops: 5000, disksize: 300},
  {id: 10, catalog: "Bundle_C", product: "SAP ECC", platform: "ABAP", saps: 80000, memory: 192, io: 25000, iops: 30000, disksize: 1000},
  {id: 11, catalog: "Bundle_C", product: "SAP Content Server", platform: "STANDALONE", saps: 8000, memory: 32, io: 4000, iops: 5000, disksize: 500},
  {id: 12, catalog: "Bundle_C", product: "NetWeaver", platform: "JAVA", saps: 30000, memory: 96, io: 8000, iops: 9000, disksize: 300},
  {id: 13, catalog: "Bundle_C", product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 14, catalog: "Bundle_C", product: "Process Integration", platform: "ABAP+JAVA", saps: 8000, memory: 32, io: 4000, iops: 5000, disksize: 500},
  {id: 15, catalog: "Bundle_C", product: "SAP SUP", platform: "STANDALONE", saps: 3000, memory: 32, io: 4000, iops: 5000, disksize: 300},
  {id: 16, catalog: "Bundle_C", product: "SAP SCM", platform: "ABAP", saps: 5000, memory: 24, io: 4000, iops: 5000, disksize: 400},
  {id: 17, catalog: "Bundle_C", product: "SCM Live Cache", platform: "STANDALONE", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300}

  
  ])