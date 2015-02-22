require 'dcf'
require 'open-uri'
require 'rubygems/package'

class CranPackages
  URL = URI.parse('http://cran.r-project.org/src/contrib/PACKAGES')

  def initialize
    OpenURI::Buffer.send(:remove_const, 'StringMax')
    OpenURI::Buffer.const_set('StringMax', 0)
  end

  def all
    packages = basic_information.map {|params| Package.new(params) }
    packages.each {|p| fill_details(p) }
  end

  private
  def basic_information
    begin
      packages_info = Net::HTTP.get(URL)
      packages = Dcf.parse(packages_info)[0, 50]
      packages.map {|p| { name: p["Package"], version: p["Version"] } }
    rescue
      Kernel.puts("It was not possible to access cran site.")
    end
  end

  def fill_details(package)
    params = build_params(details_of(package))
    package.assign_attributes(params)
  end

  def details_of(package)
    data = nil
    open(package.url) do |remote_file|
      tar = Gem::Package::TarReader.new(Zlib::GzipReader.open(remote_file))
      data = tar.seek("#{package.name}/DESCRIPTION") {|d| Dcf.parse(d.read)[0] }
    end
    data
  end

  def build_params(data)
    { publication: data["Date/Publication"], title: data["Title"], description: data["Description"], authors: data["Author"], maintainers: data["Maintainer"] }
  end
end
