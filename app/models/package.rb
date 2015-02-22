class Package < ActiveRecord::Base

  def url
    "http://cran.r-project.org/src/contrib/#{name}_#{version}.tar.gz"
  end

end
