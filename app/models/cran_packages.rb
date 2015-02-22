require 'dcf'

class CranPackages

  def get_information
    begin
      packages_info = Net::HTTP.get(URI.parse('http://cran.r-project.org/src/contrib/PACKAGES'))
      packages = Dcf.parse(packages_info)[0, 10]
    rescue
      Kernel.puts("It was not possible to access cran site.")
    end
  end
end
