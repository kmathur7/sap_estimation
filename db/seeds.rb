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
  {id: 1, name: "Bundle A"},
  {id: 2, name: "Bundle B"},
  {id: 3, name: "Bundle C"}
  
  ])
QuickSizer.create!([
  {id: 1, catalog_id: 1, product: "SAP ECC", platform: "ABAP", saps: 20000, memory: 64, IO: 4000, IOPS: 5000, disksize: 1000},
  {id: 2, catalog_id: 1, product: "SAP Content Server", platform: "STANDALONE", saps: 2000, memory: 16, IO: 1000, IOPS: 1200, disksize: 300},
  {id: 3, catalog_id: 1, product: "NewWeaver", platform: "JAVA", saps: 7000, memory: 48, IO: 2500, IOPS: 3000, disksize: 300},
  {id: 4, catalog_id: 1, product: "Solution Manager", platform: "STANDALONE", saps: 1000, memory: 16, IO: 1000, IOPS: 1200, disksize: 300},
  {id: 5, catalog_id: 2, product: "SAP ECC", platform: "ABAP", saps: 40000, memory: 128, IO: 15000, IOPS: 16000, disksize: 1000},
  {id: 6, catalog_id: 2, product: "SAP Content Server", platform: "STANDALONE", saps: 4000, memory: 16, IO: 2500, IOPS: 3000, disksize: 300},
  {id: 7, catalog_id: 2, product: "NetWeaver", platform: "JAVA", saps: 15000, memory: 64, IO: 5000, IOPS: 6000, disksize: 300},
  {id: 8, catalog_id: 2, product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, IO: 1000, IOPS: 1200, disksize: 300},
  {id: 9, catalog_id: 2, product: "Process Integration", platform: "ABAP+JAVA", saps: 4000, memory: 32, IO: 4000, IOPS: 5000, disksize: 300},
  {id: 10, catalog_id: 3, product: "SAP ECC", platform: "ABAP", saps: 80000, memory: 192, IO: 25000, IOPS: 30000, disksize: 1000},
  {id: 11, catalog_id: 3, product: "SAP Content Server", platform: "STANDALONE", saps: 8000, memory: 32, IO: 4000, IOPS: 5000, disksize: 500},
  {id: 12, catalog_id: 3, product: "NetWeaver", platform: "JAVA", saps: 30000, memory: 96, IO: 8000, IOPS: 9000, disksize: 300},
  {id: 13, catalog_id: 3, product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, IO: 1000, IOPS: 1200, disksize: 300},
  {id: 14, catalog_id: 3, product: "Process Integration", platform: "ABAP+JAVA", saps: 8000, memory: 32, IO: 4000, IOPS: 5000, disksize: 500},
  {id: 15, catalog_id: 3, product: "SAP SUP", platform: "STANDALONE", saps: 3000, memory: 32, IO: 4000, IOPS: 5000, disksize: 300},
  {id: 16, catalog_id: 3, product: "SAP SCM", platform: "ABAP", saps: 5000, memory: 24, IO: 4000, IOPS: 5000, disksize: 400},
  {id: 17, catalog_id: 3, product: "SCM Live Cache", platform: "STANDALONE", saps: 1000, memory: 16, IO: 1000, IOPS: 1200, disksize: 300}

  
  ])