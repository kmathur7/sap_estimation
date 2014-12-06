class QsizerController < ApplicationController
  def show
    @product = QuickSizer.where("catalog=?",params[:id]).pluck(:product) 
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
    saps_per_core=2000
    @input = Array.new
    
    
    params[:component].each do |component|
      comp = component[:name].to_s
      server = comp.split.first
      $i = 0
      while $i < component[:scale] do
      data = Hash.new
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
    puts @input.size
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
            ram=((0.65*memory)/ 4).ceil
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
            netio=((0.65*io)/ 4).ceil
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
            io=((0.0*iops)/ 4).ceil
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
            vdisk=(((0.0*disksize)/ 4)+200).ceil
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
  
  

end
