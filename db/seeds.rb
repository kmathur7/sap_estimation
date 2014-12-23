# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Landscape.delete_all
QuickSizer.delete_all
Component.delete_all
Infracatalog.delete_all
Designrationale.delete_all
Bladeparameter.delete_all
Resourceweightage.delete_all
AssumptionsAtTarget.delete_all
VmwareHaServerReq.delete_all
ApplicationToDatabaseRatio.delete_all
Users.delete_all

Landscape.create!([
  {id: 1, name: "Production"},
  {id: 2, name: "Pre-Production"},
  {id: 3, name: "Development"},
  {id: 4, name: "Staging"},
  {id: 5, name: "Testing"}
  
  ])

QuickSizer.create!([
  {id: 1, product: "SAP ECC", platform: "ABAP", saps: 80000, memory: 192, io: 25000, iops: 30000, disksize: 1000},
  {id: 2, product: "SAP Content Server", platform: "STANDALONE", saps: 8000, memory: 32, io: 4000, iops: 5000, disksize: 500},
  {id: 3, product: "NetWeaver", platform: "JAVA", saps: 30000, memory: 96, io: 8000, iops: 9000, disksize: 300},
  {id: 4, product: "Solution Manager", platform: "ABAP+JAVA", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300},
  {id: 5, product: "Process Integration", platform: "ABAP+JAVA", saps: 8000, memory: 32, io: 4000, iops: 5000, disksize: 500},
  {id: 6, product: "SAP SUP", platform: "STANDALONE", saps: 3000, memory: 32, io: 4000, iops: 5000, disksize: 300},
  {id: 7, product: "SAP SCM", platform: "ABAP", saps: 5000, memory: 24, io: 4000, iops: 5000, disksize: 400},
  {id: 8, product: "SCM Live Cache", platform: "STANDALONE", saps: 1000, memory: 16, io: 1000, iops: 1200, disksize: 300}
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

Infracatalog.create!([
  {id: 1, catalog: "Extra Small", subcatalog: "ExtraSmall1", vcpu: 1, vram: 4, vnic: 3},
  {id: 2, catalog: "Extra Small", subcatalog: "ExtraSmall2", vcpu: 1, vram: 8, vnic: 3},
  {id: 3, catalog: "Extra Small", subcatalog: "ExtraSmall3", vcpu: 1, vram: 16, vnic: 3},
  {id: 4, catalog: "Small", subcatalog: "Small1", vcpu: 2, vram: 8, vnic: 3},
  {id: 5, catalog: "Small", subcatalog: "Small2", vcpu: 2, vram: 16, vnic: 3},
  {id: 6, catalog: "Small", subcatalog: "Small3", vcpu: 2, vram: 32, vnic: 3},
  {id: 7, catalog: "Medium", subcatalog: "Medium1", vcpu: 4, vram: 16, vnic: 3},
  {id: 8, catalog: "Medium", subcatalog: "Medium2", vcpu: 4, vram: 32, vnic: 3},
  {id: 9, catalog: "Medium", subcatalog: "Medium3", vcpu: 4, vram: 64, vnic: 3},
  {id: 10, catalog: "Large", subcatalog: "Large1", vcpu: 8, vram: 32, vnic: 3},
  {id: 11, catalog: "Large", subcatalog: "Large2", vcpu: 8, vram: 64, vnic: 3},
  {id: 12, catalog: "Large", subcatalog: "Large3", vcpu: 8, vram: 96, vnic: 3},
  {id: 13, catalog: "Extra Large", subcatalog: "ExtraLarge1", vcpu: 12, vram: 64, vnic: 3},
  {id: 14, catalog: "Extra Large", subcatalog: "ExtraLarge2", vcpu: 12, vram: 96, vnic: 3},
  {id: 15, catalog: "Extra Large", subcatalog: "ExtraLarge3", vcpu: 12, vram: 128, vnic: 3},
  {id: 16, catalog: "Double Extra Large", subcatalog: "DoubleExtraLarge1", vcpu: 24, vram: 96, vnic: 3},
  {id: 17, catalog: "Double Extra Large", subcatalog: "DoubleExtraLarge2", vcpu: 24, vram: 128, vnic: 3},
  {id: 18, catalog: "Double Extra Large", subcatalog: "DoubleExtraLarge3", vcpu: 24, vram: 192, vnic: 3},
  {id: 19, catalog: "Custom", subcatalog: "Custom1", vcpu: 24, vram: 256, vnic: 3},
  {id: 20, catalog: "Custom", subcatalog: "Custom2", vcpu: 24, vram: 512, vnic: 3},
  {id: 21, catalog: "Custom", subcatalog: "Custom3", vcpu: 24, vram: 1024, vnic: 3}
 ])

Designrationale.create!([
  {id: 1, landscape: "Production", pcore: 1, pram: 1, pnic: 10},
  {id: 2, landscape: "Pre-Production", pcore: 2, pram: 2, pnic: 10},
  {id: 3, landscape: "Development", pcore: 2, pram: 2, pnic: 10},
  {id: 4, landscape: "Staging", pcore: 2, pram: 2, pnic: 10},
  {id: 5, landscape: "Testing", pcore: 2, pram: 2, pnic: 10}
   ])

Bladeparameter.create!([
  {id: 1, pcore: 16,pram: 192, pnic: 10}
  ])

Resourceweightage.create!([
  {id: 1, cpu: 100,ram: 0, nic: 0}
  ])

AssumptionsAtTarget.create!([
  {id: 1, percentage: 100, decimal: 1.0}
  ])

VmwareHaServerReq.create!([
  {id: 1, protected: 16,failover: 1}
  ])
ApplicationToDatabaseRatio.create!([
  {id: 1, application: 0.65,database: 0.35}
  ])
Users.create!([
  {id: 1, username: "admin",password: "admin123", role:"admin"},
  {id: 2, username: "user1",password: "password", role:"user"},
  {id: 3, username: "user2",password: "password", role:"user"},
  {id: 4, username: "user3",password: "password", role:"user"},
  {id: 5, username: "user4",password: "password", role:"user"}
  ])



