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
Component.delete_all

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
  {id: 1, catalog: "Bundle A", product: "SAP ECC", platform: "ABAP", saps: 20000, memory: 64, io: 4000, iops: 5000, disksize: 1000},
  {id: 2, catalog: "Bundle A", product: "SAP Content Server", platform: "STANDALONE", saps: 2000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 3, catalog: "Bundle A", product: "NewWeaver", platform: "JAVA", saps: 7000, memory: 48, io: 2500, iops: 3000, disksize: 300},
  {id: 4, catalog: "Bundle A", product: "Solution Manager", platform: "STANDALONE", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 5, catalog: "Bundle B", product: "SAP ECC", platform: "ABAP", saps: 40000, memory: 128, io: 15000, iops: 16000, disksize: 1000},
  {id: 6, catalog: "Bundle B", product: "SAP Content Server", platform: "STANDALONE", saps: 4000, memory: 16, io: 2500, iops: 3000, disksize: 300},
  {id: 7, catalog: "Bundle B", product: "NetWeaver", platform: "JAVA", saps: 15000, memory: 64, io: 5000, iops: 6000, disksize: 300},
  {id: 8, catalog: "Bundle B", product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 9, catalog: "Bundle B", product: "Process Integration", platform: "ABAP+JAVA", saps: 4000, memory: 32, io: 4000, iops: 5000, disksize: 300},
  {id: 10, catalog: "Bundle C", product: "SAP ECC", platform: "ABAP", saps: 80000, memory: 192, io: 25000, iops: 30000, disksize: 1000},
  {id: 11, catalog: "Bundle C", product: "SAP Content Server", platform: "STANDALONE", saps: 8000, memory: 32, io: 4000, iops: 5000, disksize: 500},
  {id: 12, catalog: "Bundle C", product: "NetWeaver", platform: "JAVA", saps: 30000, memory: 96, io: 8000, iops: 9000, disksize: 300},
  {id: 13, catalog: "Bundle C", product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 14, catalog: "Bundle C", product: "Process Integration", platform: "ABAP+JAVA", saps: 8000, memory: 32, io: 4000, iops: 5000, disksize: 500},
  {id: 15, catalog: "Bundle C", product: "SAP SUP", platform: "STANDALONE", saps: 3000, memory: 32, io: 4000, iops: 5000, disksize: 300},
  {id: 16, catalog: "Bundle C", product: "SAP SCM", platform: "ABAP", saps: 5000, memory: 24, io: 4000, iops: 5000, disksize: 400},
  {id: 17, catalog: "Bundle C", product: "SCM Live Cache", platform: "STANDALONE", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300}

  
  ])

Component.create!([
  {id: 1, product: "SAP ECC", platform: "ABAP",servername:"Application Server"},
  {id: 2, product: "SAP ECC", platform: "ABAP",servername:"Database Server"},
  {id: 3, product: "SAP ECC", platform: "ABAP",servername:"SCS Server"},
  {id: 4, product: "Trex", platform: "STANDALONE",servername:"Standalone Trex Server"},
  {id: 5, product: "NetWeaver", platform: "JAVA",servername:"Application Server"},
  {id: 6, product: "NetWeaver", platform: "JAVA",servername:"Database Server"},
  {id: 7, product: "NetWeaver", platform: "JAVA",servername:"SCS Server"},
  {id: 8, product: "NetWeaver", platform: "JAVA",servername:"Web Dispatcher Server"},
  {id: 9, product: "Solution Manager", platform: "STANDALONE",servername:"Standalone SOLMAN Server"},
  {id: 10, product: "Solution Manager", platform: "ABAP+JAVA",servername:"Application Server"},
  {id: 11, product: "Solution Manager", platform: "ABAP+JAVA",servername:"Database Server"},
  {id: 12, product: "Solution Manager", platform: "ABAP+JAVA",servername:"SCS Server"},
  {id: 13, product: "Solution Manager", platform: "ABAP+JAVA",servername:"Web Dispatcher Server"},
  {id: 14, product: "Process Integration", platform: "ABAP+JAVA",servername:"Application Server"},
  {id: 15, product: "Process Integration", platform: "ABAP+JAVA",servername:"Database Server"},
  {id: 16, product: "Process Integration", platform: "ABAP+JAVA",servername:"SCS Server"},
  {id: 17, product: "Process Integration", platform: "ABAP+JAVA",servername:"Web Dispatcher Server"},
  {id: 18, product: "Business Intelligence", platform: "ABAP",servername:"Application Server"},
  {id: 19, product: "Business Intelligence", platform: "ABAP",servername:"Database Server"},
  {id: 20, product: "Business Intelligence", platform: "ABAP",servername:"SCS Server"},
  {id: 21, product: "Business Intelligence", platform: "JAVA",servername:"Application Server"},
  {id: 22, product: "Business Intelligence", platform: "JAVA",servername:"Database Server"},
  {id: 23, product: "Business Intelligence", platform: "JAVA",servername:"SCS Server"},
  {id: 24, product: "Business Intelligence", platform: "JAVA",servername:"Web Dispatcher Server"},
  {id: 25, product: "Business Object", platform: "BO Platform",servername:"WebApp BO Server"},
  {id: 26, product: "Business Object", platform: "BO Platform",servername:"Integration BO Server"},
  {id: 27, product: "Business Object", platform: "BO Platform",servername:"Processing BO Server"},
  {id: 28, product: "Business Object", platform: "BO Platform",servername:"Database BO Server"},
  {id: 29, product: "SAP SUP", platform: "STANDALONE",servername:"Standalone SUP Server"},
  {id: 30, product: "SAP CRM", platform: "ABAP",servername:"Application Server"},
  {id: 31, product: "SAP CRM", platform: "ABAP",servername:"Database Server"},
  {id: 32, product: "SAP CRM", platform: "ABAP",servername:"SCS Server"},
  {id: 33, product: "SAP CRM", platform: "JAVA",servername:"Application Server"},
  {id: 34, product: "SAP CRM", platform: "JAVA",servername:"Database Server"},
  {id: 35, product: "SAP CRM", platform: "JAVA",servername:"SCS Server"},
  {id: 36, product: "SAP CRM", platform: "JAVA",servername:"Web Dispatcher Server"},
  {id: 37, product: "SAP SRM", platform: "ABAP",servername:"Application Server"},
  {id: 38, product: "SAP SRM", platform: "ABAP",servername:"Database Server"},
  {id: 39, product: "SAP SRM", platform: "ABAP",servername:"SCS Server"},
  {id: 40, product: "SAP SRM", platform: "JAVA",servername:"Application Server"},
  {id: 41, product: "SAP SRM", platform: "JAVA",servername:"Database Server"},
  {id: 42, product: "SAP SRM", platform: "JAVA",servername:"SCS Server"},
  {id: 43, product: "SAP SRM", platform: "JAVA",servername:"Web Dispatcher Server"},
  {id: 44, product: "SAP SCM", platform: "ABAP",servername:"Application Server"},
  {id: 45, product: "SAP SCM", platform: "ABAP",servername:"Database Server"},
  {id: 46, product: "SAP SCM", platform: "ABAP",servername:"SCS Server"},
  {id: 47, product: "SCM Live Cache", platform: "STANDALONE",servername:"Standalone LC Server"},
  {id: 48, product: "BPC for BI", platform: "STANDALONE",servername:"Standalone BPC Server"},
  {id: 49, product: "SAP Content Server", platform: "STANDALONE",servername:"Standalone SCS Server"},

 
  
  ])