class PackageManager

  def self.update
    packages = CranPackages.new.all
    
    packages.each do |package|
      unless package.exists?
        package.save
      end
    end
  end

end
