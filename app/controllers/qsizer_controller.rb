class QsizerController < ApplicationController
  def show
    @product = QuickSizer.all.pluck(:product) 
  end
  
  def platforms
    @platform = QuickSizer.where("catalog=? AND product=?",params[:catalog],params[:product]).pluck(:platform)
  end
  
  def components
    @components = Component.where("product=? AND platform=?",params[:product],params[:platform]).pluck(:servername)
  end
  
  def create
     
    saps = QuickSizer.where("catalog=? AND product=? AND platform=?",params[:catalog],params[:product],params[:platform]).pluck(:saps).join(" ").to_i
    io = QuickSizer.where("catalog=? AND product=? AND platform=?",params[:catalog],params[:product],params[:platform]).pluck(:io).join(" ").to_i
    memory = QuickSizer.where("catalog=? AND product=? AND platform=?",params[:catalog],params[:product],params[:platform]).pluck(:memory).join(" ").to_i
    iops =  QuickSizer.where("catalog=? AND product=? AND platform=?",params[:catalog],params[:product],params[:platform]).pluck(:iops).join(" ").to_i
    disksize = QuickSizer.where("catalog=? AND product=? AND platform=?",params[:catalog],params[:product],params[:platform]).pluck(:disksize).join(" ").to_i
    saps_per_core=2300
    @input = Array.new
    
    
    params[:component].each do |component|
      comp = component[:name].to_s
      server = comp.split.first
      $i = 0
      while $i < component[:scale] do
      data = Hash.new
        data['landscape'] = params[:landscape]
      data['server'] = component[:name]
      vcpu = vCPU(server,saps,saps_per_core)
      data['vcpu'] = vcpu
      vram = vRAM(server,memory)
      data['vram'] = vram
      data['netio'] = netIO(server,io)
      data['iops'] = iops(server,iops)
      data['vdisk'] =vDisk(server,disksize)
      data['catalog'] = findCatalog(cpu(vcpu),ram(vram))
        $i+=1
      @input << data
      end
    end
  
  end
  
  def vCPU(server,saps,saps_per_core)
        if(server==="Application")
            cpu=(((0.65*saps)/ 2)/ saps_per_core).ceil
        elsif(server==="SCS")
            cpu=(((0.65*saps)/ 4)/ saps_per_core).ceil
        elsif(server==="Database")
            cpu=(((0.35*saps)/ 2)/ saps_per_core).ceil
        else
            cpu=(((1.0*saps)/ 2)/ saps_per_core).ceil
        end
        return cpu
  end
  
  def vRAM(server,memory)
        if(server==="Application")
            ram=(((0.65*memory)/ 2).ceil)
        elsif(server==="SCS")
          ram=((0.65*memory)/ 4).round
        elsif(server==="Database")
            ram=((0.35*memory)/ 2).ceil
        else
            ram=((1.0*memory)/ 2).ceil
        end
        return ram
  end
  
  def netIO(server,io)
        if(server==="Application")
            netio=(((0.65*io)/ 2).ceil)
        elsif(server==="SCS")
          netio=((0.65*io)/ 4).round
        elsif(server==="Database")
            netio=((0.35*io)/ 2).ceil
        else
            netio=((1.0*io)/ 2).ceil
        end
        return netio
  end
  
  def iops(server,iops)
        if(server==="Application")
            io=(((0.0*iops)/ 2).ceil)
        elsif(server==="SCS")
          io=((0.0*iops)/ 4).round
        elsif(server==="Database")
            io=(1.0*iops).ceil
        else
            io=((0.0*iops)/ 2).ceil
        end
    return io
  end
  
  def vDisk(server,disksize)
        if(server==="Application")
          vdisk=((((0.0*disksize)/ 2)+200).ceil)
        elsif(server==="SCS")
          vdisk=(((0.0*disksize)/ 4)+200).round
        elsif(server==="Database")
            vdisk=((1.0*disksize)+200).ceil
        else
            vdisk=(((0.0*disksize)/ 2)+200).ceil
        end
    return vdisk
  end
  
  #Function to Convert vCPU value to nearest 1,2,4,8,12,24 value
  def cpu(vcpu)
          if(vcpu<=1)
                cpu=1
          elsif(vcpu<=2)
                cpu=2
          elsif(vcpu<=4)
                cpu=4
          elsif(vcpu<=8)
                cpu=8
          elsif(vcpu<=12)
                cpu=12
          elsif(vcpu<=24)
                cpu=24
          else
               cpu=vcpu
      end
    return cpu
  end
  #Function to Convert vRAM value to nearest 1024,512,256,192,128,96,64,32,16,8,4 value
  def ram(vram)
          if(vram<=4)
                ram=4
          elsif(vram<=8)
                ram=8
          elsif(vram<=16)
                ram=16
          elsif(vram<=32)
                ram=32
          elsif(vram<=64)
                ram=64
          elsif(vram<=96)
                ram=96
          elsif(vram<=128)
                ram=128
          elsif(vram<=192)
                ram=192
          elsif(vram<=256)
                ram=256
          elsif(vram<=512)
                ram=512
          elsif(vram<=1024)
                ram=1024
         
          else
               ram=vram
      end
    return ram
  end
  
  #function to find subcatalog value given the vcpu, vram and vnic values
  def findCatalog(vcpu,vram)
    catalog = Infracatalog.where("vcpu=? AND vram=?",vcpu,vram).pluck(:subcatalog).join(" ")
    return catalog
  end
  
  def output
    a = request.POST
    catalog = Array.new
    scale = Array.new
    type = Array.new #stores whether virtual or Physical
    b = Array.new
    b=a[:_json]
    b.each do |dataset|
      catalog << dataset[:catalog]
      scale << 1
      @landscape = dataset[:landscape]
      type << dataset[:type]
    end
    subcatalog = Infracatalog.pluck(:subcatalog)
    cpu = Infracatalog.pluck(:vcpu)
    ram = Infracatalog.pluck(:vram)
    nic = Infracatalog.pluck(:vnic)
    catalog_size = subcatalog.size()
    catalogsize = catalog.size()
    pcore = fetchpcore(@landscape)
    pram = fetchpram(@landscape)
    pnic = fetchpnic(@landscape)
    pcore_blade = Bladeparameter.pluck(:pcore).join(" ").to_f
    pram_blade = Bladeparameter.pluck(:pram).join(" ").to_f
    pnic_blade = Bladeparameter.pluck(:pnic).join(" ").to_f
    cpu_resourceweightages = Resourceweightage.pluck(:cpu).join(" ").to_f
    ram_resourceweightages = Resourceweightage.pluck(:ram).join(" ").to_f
    nic_resourceweightages = Resourceweightage.pluck(:nic).join(" ").to_f
    vh_cpu_utilization = AssumptionsAtTarget.pluck(:decimal).join(" ").to_f
    vm_protected = VmwareHaServerReq.pluck(:protected).join(" ").to_f
    vm_failover = VmwareHaServerReq.pluck(:failover).join(" ").to_f
    
    physical=Array.new(catalog_size,0)#physical
    virtual=Array.new(catalog_size,0)#virtual
    totalvcpu=Array.new(catalog_size,0)#
    totalvram=Array.new(catalog_size,0)
    totalvnic=Array.new(catalog_size,0)
    totalpcores=Array.new(catalog_size,0)
    totalpram=Array.new(catalog_size,0)
    totalpnic=Array.new(catalog_size,0)
    servercpu=Array.new(catalog_size,0)
    serverram=Array.new(catalog_size,0)
    servernic=Array.new(catalog_size,0)
    
    j=0 # count of the types of the catalogs got
      while j < catalogsize
        i=0  # total count of the types of the catalogs 
          while i < catalog_size
              if(subcatalog[i]===catalog[j])
                if(type[j]==="Physical")
                    physical[i]=scale[j]
                     virtual[i]=0
                  else
                    virtual[i]=scale[j]
                    physical[i]=0
                    totalvcpu[i]=virtual[i]*cpu[i]
                    totalvram[i]=virtual[i]*ram[i]
                    totalvnic[i]=virtual[i]*nic[i]
                  #Design rationale calculation
                    totalpcores[i]=totalvcpu[i]/ pcore
                    totalpram[i]=totalvram[i]/ pram
                    totalpnic[i]=(totalvnic[i]/ pnic).ceil
                   
                    servercpu[i]=(totalpcores[i]/ pcore_blade).ceil
                    serverram[i]=(totalpram[i]/ pram_blade).ceil
                    servernic[i]=(totalpnic[i]/ pnic_blade).ceil
                  end
              end
              i+=1
          end
          j+=1
    end
    totalservercpu=servercpu.sum #L26
    totalserverram=serverram.sum #M26
    totalservernic=servernic.sum #N26
    
    
    @total_physical_server_for_virtualization=((((totalservercpu* cpu_resourceweightages)+(totalserverram* ram_resourceweightages)+(totalservernic* nic_resourceweightages))/ ( cpu_resourceweightages+ ram_resourceweightages+ nic_resourceweightages))*vh_cpu_utilization).ceil
    
    @include_failover_capacity = (((@total_physical_server_for_virtualization/ vm_protected)*vm_failover)+@total_physical_server_for_virtualization).ceil
    @no_physical_servers_opted = physical.sum
    @total_physical_servers = @include_failover_capacity + @no_physical_servers_opted
    
  end
  
  #Function to fetch pCore value from Design Rationale based on landscape
  #1 pCore = _____ vCPU in Qty
  def fetchpcore(landscape)
    pcore = Designrationale.where("landscape=?",landscape).pluck(:pcore).join(" ").to_f
    return pcore
  end
  
  #Function to fetch pRAM value from Design Rationale based on landscape
  #1GB pRAM = ____ vRAM in GB
  def fetchpram(landscape)
    pram = Designrationale.where("landscape=?",landscape).pluck(:pram).join(" ").to_f
    return pram
  end
  #Function to fetch pNIC value from Design Rationale based on landscape
  #1pNIC = ____ vNIC in Qty
  def fetchpnic(landscape)
    pnic = Designrationale.where("landscape=?",landscape).pluck(:pnic).join(" ").to_f
    return pnic
  end
  
  

end
