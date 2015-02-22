class Package < ActiveRecord::Base

  def url
    "http://cran.r-project.org/src/contrib/#{name}_#{version}.tar.gz"
  end

  def exists?
    Package.where("name = ? and version = ?", name, version).present?
  end

end
