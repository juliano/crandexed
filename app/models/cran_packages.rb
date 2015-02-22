require 'dcf'

class CranPackages
  URL = URI.parse('http://cran.r-project.org/src/contrib/PACKAGES')

  def all
    packages = basic_information.map {|params| Package.new(params) }
  end

  private
  def basic_information
    begin
      packages_info = Net::HTTP.get(URL)
      packages = Dcf.parse(packages_info)[0, 10]
      packages.map {|p| { name: p["Package"], version: p["Version"] } }
    rescue
      Kernel.puts("It was not possible to access cran site.")
    end
  end
end
