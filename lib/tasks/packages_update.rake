namespace :crandexed do

  desc "Update packages from cran base"
  task update: :environment do
    PackageManager.update
  end

end
